import 'package:flutter/material.dart';
import 'package:task2_clean_arch_and_widgets_tour/challenge1/widgets/build_confirmatin_for_delete.dart';
import 'package:task2_clean_arch_and_widgets_tour/challenge1/widgets/build_snack_bar_for_undo_delete.dart';
import 'package:task2_clean_arch_and_widgets_tour/challenge1/widgets/list_item.dart';

class DismissibleForList extends StatelessWidget {
  const DismissibleForList({
    super.key,
    required this.tasks,
    required this.index,
    required this.onRemove,
    required this.onUndo,
  });

  final List<String> tasks;
  final int index;
  final VoidCallback onRemove;
  final Function(String) onUndo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(tasks[index]),
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return await buildConfirmatinForDelete(context, tasks[index]) ??
              false;
        }
        return true;
      },
      onDismissed: (direction) {
        final task = tasks[index];
        debugPrint(task);
        onRemove(); // استدعاء رد الفعل للحذف
        if (direction == DismissDirection.endToStart) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(buildSnackBarForUndoDelete(() => onUndo(task)));
        }
      },
      child: ListItem(taskTitle: tasks[index]),
    );
  }
}
