import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(30),
        hintText: 'O que você procura?',
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(
          Icons.search,
          size: 30,
        ),
      ),
    );
  }
}
