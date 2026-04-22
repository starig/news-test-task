import 'package:flutter/material.dart';

class ErrorSnackBarContent extends StatelessWidget {
  final String message;

  const ErrorSnackBarContent({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}

SnackBar buildErrorSnackBar(String message) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 3),
    content: ErrorSnackBarContent(message: message),
  );
}

void showErrorSnackBar(
  BuildContext context, {
  required String message,
}) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  scaffoldMessenger
    ..hideCurrentSnackBar()
    ..showSnackBar(buildErrorSnackBar(message));
}
