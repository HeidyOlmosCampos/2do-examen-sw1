import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/constants/index.dart';

class CustomDialog {
  static void showErrorDialog(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 1, 25, 45),
        title: Text(
          title,
          style: const TextStyle(color: gray),
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: const TextStyle(color: gray),
        ),
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: TextStyle(color: red),),
          ),
        ],
      ),
    );
  }

  static void showSuccessDialog(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 1, 25, 45),
        title: Text(
          title,
          style: const TextStyle(color: gray),
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: const TextStyle(color: gray),
        ),
        icon: const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: TextStyle(color: red),),
          ),
        ],
      ),
    );
  }
}
