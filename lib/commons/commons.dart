import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigaton(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => widget),
  );
}

void snackbar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
    ),
  );
}
