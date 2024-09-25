import 'package:app_test_fiap/app/features/home/view/widgets/email_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscribeEmailWidget extends StatefulWidget {
  const SubscribeEmailWidget({super.key});

  @override
  State<SubscribeEmailWidget> createState() => _SubscribeEmailWidgetState();
}

class _SubscribeEmailWidgetState extends State<SubscribeEmailWidget> {
  TextEditingController emailController = TextEditingController(text: '');
  final formKey =
      GlobalKey<FormState>(debugLabel: '_SubscribeEmailWidgetState');

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFF8FFF24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              'Inscreva-se para ganhar descontos!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: GoogleFonts.orbitron().fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Cadastre seu email, receba novidades e descontos imperdíveis'
              ' antes de todo mundo!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: EmailTextFieldWidget(controller: emailController),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(
                  Color(0xFF780BF7),
                ),
                padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                  EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    left: 30,
                    right: 30,
                  ),
                ),
              ),
              child: const Text(
                'Inscrever',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
