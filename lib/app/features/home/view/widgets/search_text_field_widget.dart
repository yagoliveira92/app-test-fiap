import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(30),
        hintText: 'O que você procura?',
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}
