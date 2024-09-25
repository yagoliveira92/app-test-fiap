import 'package:app_test_fiap/app/core/extensions/string_extension.dart';
import 'package:app_test_fiap/app/features/home/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({required this.categories, super.key});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final category = categories[index];
          return Card(
            margin: const EdgeInsets.all(20),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Image.network(
                  category.imagem ?? '',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    category.nome?.toCapitalized ?? '',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: GoogleFonts.orbitron().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: categories.length,
      ),
    );
  }
}
