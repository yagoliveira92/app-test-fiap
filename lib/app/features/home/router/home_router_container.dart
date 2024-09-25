import 'package:app_test_fiap/app/features/home/view/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final getRouterContainer = [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
];
