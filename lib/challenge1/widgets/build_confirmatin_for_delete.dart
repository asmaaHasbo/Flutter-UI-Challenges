  import 'package:flutter/material.dart';

Future<bool?> buildConfirmatinForDelete(BuildContext context, String tasks) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confrim Delete'),
        content: Text('Delete $tasks?'),
        actions: [
          TextButton(
            //---- false يعني مش تمسح وسيب العنصر موجود في الليست
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),
          TextButton(
            //----- true يعني شيل العنصر من الليست
            onPressed: () => Navigator.pop(context, true),
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
