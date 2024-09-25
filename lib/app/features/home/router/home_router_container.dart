import 'package:app_test_fiap/app/core/containers/injection_container.dart';
import 'package:app_test_fiap/app/features/home/controller/home_cubit.dart';
import 'package:app_test_fiap/app/features/home/view/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final getRouterContainer = [
  GoRoute(
    path: '/',
    builder: (context, state) => BlocProvider<HomeCubit>(
      create: (context) => dependency.get<HomeCubit>()..getHomeData(),
      child: const HomePage(),
    ),
  ),
];
