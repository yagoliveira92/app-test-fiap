import 'package:app_test_fiap/app/core/extensions/string_extension.dart';
import 'package:app_test_fiap/app/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({required this.products, super.key});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(20),
            color: const Color(0xFFEFEFEF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(
                  product.imagem ?? '',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    product.nome?.toCapitalized ?? '',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: GoogleFonts.orbitron().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    product.preco.toString().replaceAll('.', ','),
                    style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: 4,
      ),
    );
  }
}
