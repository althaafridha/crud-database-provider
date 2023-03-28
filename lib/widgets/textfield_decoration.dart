import 'package:flutter/material.dart';

Container textFieldDecoration({
  required Widget child,
  double? height
}) {
  return Container(
    height: height,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
    ),
    child: child,
  );
}