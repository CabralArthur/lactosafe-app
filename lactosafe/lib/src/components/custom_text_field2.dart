import 'package:flutter/material.dart';

class CustomTextField2 extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isObscure;
  final TextEditingController controller;

  const CustomTextField2({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            labelText: label,
            isDense: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(18))),
      ),
    );
  }
}
