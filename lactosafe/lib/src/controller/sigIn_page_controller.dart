import 'package:flutter/material.dart';

void submitForm(GlobalKey<FormState> formkey, BuildContext context) {
  if (formkey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Email com instruções para nova senha enviado')));
  }
}

String? validateForm(String? value) {
  if (value == null || value.isEmpty) {
    return 'Informe algum email';
  }
  return null;
}
