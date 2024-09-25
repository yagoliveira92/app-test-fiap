import 'package:flutter/material.dart';

class LinkTextWidget extends StatelessWidget {
  const LinkTextWidget({required this.text, required this.onTap, super.key});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(
          color: Color(0xFF780BF7),
          fontSize: 31,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          decorationColor: Color(0xFF780BF7),
        ),
      ),
    );
  }
}
