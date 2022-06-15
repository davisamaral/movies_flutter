import 'package:flutter/material.dart';

class AccountButtonWidget extends StatelessWidget {
  const AccountButtonWidget({
    required this.onPressed,
    required this.label,
  }) : super(key: null);

  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      borderOnForeground: true,
      elevation: 4,
      shadowColor: Colors.black54,
      color: Colors.white,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Text(
          label,
          style: const TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
