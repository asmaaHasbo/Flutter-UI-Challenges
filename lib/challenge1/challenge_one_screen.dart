import 'package:flutter/material.dart';
import 'package:task2_clean_arch_and_widgets_tour/challenge1/widgets/dismissible_for_list.dart';

class ChallengeOneScreen extends StatefulWidget {
  const ChallengeOneScreen({super.key});

  @override
  State<ChallengeOneScreen> createState() => _ChallengeOneScreenState();
}

class _ChallengeOneScreenState extends State<ChallengeOneScreen> {
  final List<String> tasks = ['Task1', 'Task2', 'Task3', 'Task4', 'Task5'];

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _undoRemoveTask(int index, String task) {
    setState(() {
      tasks.insert(index, task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Task Manager'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final task = tasks.removeAt(oldIndex);
              tasks.insert(newIndex, task);
            });
          },
          children: tasks
              .asMap()
              .entries
              .map(
                (entry) => DismissibleForList(
                  key: ValueKey(tasks[entry.key]), // مفتاح فريد لكل عنصر
                  tasks: tasks,
                  index: entry.key,
                  onRemove: () => _removeTask(entry.key),
                  onUndo: (task) => _undoRemoveTask(entry.key, task),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}