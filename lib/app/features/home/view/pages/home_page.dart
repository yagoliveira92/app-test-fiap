import 'package:app_test_fiap/app/features/categories/view/categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu, size: 50),
          onPressed: () {},
        ),
        title: Row(
          children: [
            Spacer(
              flex: 3,
            ),
            Image.asset(
              'assets/logo/logo_usedev.png',
              height: 40,
            ),
            Spacer(),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person_2_outlined,
              size: 50,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 50,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
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
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
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
                      TextSpan(
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
                        backgroundColor: Color(0xFF780BF7), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(50.0), // Pill shape
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 25.0), // Button padding
                      ),
                      child: Text(
                        'Ver as novidades!',
                        style: TextStyle(
                          fontSize: 31.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            CategoriesWidget(),
          ],
        ),
      ),
    );
  }
}
