import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  const ListItem({required this.taskTitle, super.key});
  final String taskTitle;
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        key: ValueKey(widget.taskTitle),
        leading: Icon(Icons.drag_handle, color: Colors.grey),
        title: Text(
          widget.taskTitle,
          style: TextStyle(
            fontSize: 16,
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: (value) {
            isChecked = !isChecked;
            setState(() {});
          },
          activeColor: Colors.green,
        ),
      ),
    );
  }
}
