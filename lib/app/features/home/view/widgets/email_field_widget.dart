import 'package:app_test_fiap/app/core/validators/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailTextFieldWidget extends StatefulWidget {
  const EmailTextFieldWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  _EmailTextFieldWidgetState createState() => _EmailTextFieldWidgetState();
}

class _EmailTextFieldWidgetState extends State<EmailTextFieldWidget> {
  static final _keyEmail = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(),
      maxLength: 50,
      key: _keyEmail,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      validator: (value) {
        final validate = EmailValidator(value: value);
        return validate();
      },
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        counter: const Offstage(),
        hintText: 'Digite seu melhor endereço de email',
        hintStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
      ),
    );
  }
}
