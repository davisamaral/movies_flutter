import 'package:flutter/material.dart';

class AccountTextFieldWidget extends StatelessWidget {
  const AccountTextFieldWidget({
    required this.hint,
    required this.keyboardType,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: null);

  final String hint;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.2,
          color: Colors.white70,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        cursorColor: Colors.white,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.white70),
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
