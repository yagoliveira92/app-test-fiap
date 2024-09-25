import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerHugGeekWidget extends StatelessWidget {
  const BannerHugGeekWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_home.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Image.asset(
              'assets/images/img_hero_mobile.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text.rich(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: GoogleFonts.orbitron().fontFamily,
                fontSize: 76,
                fontWeight: FontWeight.bold,
              ),
              const TextSpan(
                text: 'Hora de abraçar seu ',
                style: TextStyle(
                  color: Color(0xFFFF55DF),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'lado geek',
                    style: TextStyle(
                      color: Color(0xFF8FFF24),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF780BF7), // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0), // Pill shape
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 25.0), // Button padding
              ),
              child: const Text(
                'Ver as novidades!',
                style: TextStyle(
                  fontSize: 31.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
