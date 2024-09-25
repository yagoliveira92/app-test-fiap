import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesCallWidget extends StatelessWidget {
  const CategoriesCallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 20),
          child: Text(
            'Categorias',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: GoogleFonts.orbitron().fontFamily,
              fontSize: 31,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Text(
            'De roupas a gadgets tecnológicos temos tudo'
            'para atender suas paixões e hobbies com estilo e autenticidade.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFF444444),
            ),
          ),
        ),
      ],
    );
  }
}
