import 'package:flutter/material.dart';

const double baseHeight = 650.0;

double screenAwareSize(double size, BuildContext context) {
  double drawingHeight =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  return size * drawingHeight / baseHeight;
}

void showSnackBar(BuildContext scaffoldContext, String message) {
  final snackBar = SnackBar(
    content: Text(message),
  );

  // Find the Scaffold in the Widget tree and use it to show a SnackBar!
  ScaffoldMessenger.of(scaffoldContext).showSnackBar(snackBar);
}
