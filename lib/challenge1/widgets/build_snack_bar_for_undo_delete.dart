import 'package:flutter/material.dart';

SnackBar buildSnackBarForUndoDelete(VoidCallback onUndo ) {
    return SnackBar(
      content: Text('Task deleted', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
      action: SnackBarAction(
        label: 'Undo',
        textColor: Colors.white,
        onPressed:onUndo,
        
      ),
    );
  }
