import 'package:app_test_fiap/app/features/home/controller/home_cubit.dart';
import 'package:app_test_fiap/app/features/home/view/widgets/banner_hug_geek_widget.dart';
import 'package:app_test_fiap/app/features/home/view/widgets/categories_call_widget.dart';
import 'package:app_test_fiap/app/features/home/view/widgets/categories_list_widget.dart';
import 'package:app_test_fiap/app/features/home/view/widgets/link_text_widget.dart';
import 'package:app_test_fiap/app/features/home/view/widgets/products_list_widget.dart';
import 'package:app_test_fiap/app/features/home/view/widgets/search_text_field_widget.dart';
import 'package:app_test_fiap/app/features/home/view/widgets/use_dev_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const UseDevAppBar(),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return switch (state) {
            HomeLoading() => const Column(
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            HomeLoaded() => CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: SearchTextFieldWidget(),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: BannerHugGeekWidget(),
                  ),
                  const SliverToBoxAdapter(
                    child: CategoriesCallWidget(),
                  ),
                  CategoriesListWidget(categories: state.categories),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      'Promos especiais',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: GoogleFonts.orbitron().fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  ProductsListWidget(products: state.products),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: LinkTextWidget(
                      text: 'Ver mais',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
