import 'package:flutter/material.dart';

// rounded text field shared by login and register screens
class WidgetAuth extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const WidgetAuth({
    super.key,
    required this.controller,
    required this.hint,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: const BorderSide(color: Colors.black12),
    );

    return TextField(
      controller: controller, // read or manage input text
      obscureText: obscureText, // hide characters
      keyboardType: keyboardType, // change keyboard type
      decoration: InputDecoration(
        hintText: hint, // placeholder
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon, color: Colors.black54),
        suffixIcon: suffixIcon == null
            ? null
            : Icon(suffixIcon, color: Colors.black54),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        border: border,
        enabledBorder: border,
      ),
    );
  }
}
