import 'package:flutter/material.dart';

class TextFieldController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Function to get the password from the password TextField
  String getPasswordFromTextField() {
    return passwordController.text;
  }

  // Function to get the email from the email TextField
  String getEmailFromTextField() {
    return emailController.text.trim();
  }
}