import 'package:app_test_fiap/app/core/storage_adapter/local_database/manager/i_local_data_manager.dart';
import 'package:flutter/material.dart';
import 'package:app_test_fiap/app/core/containers/injection_container.dart'
    as injection;
import 'package:app_test_fiap/app/core/containers/router_container.dart'
    as router;
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injection.init();
  final localDataManager = injection.dependency.get<ILocalDataManager>();
  await localDataManager.start();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'App Test FIAP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      routerConfig: router.getRoutes,
    );
  }
}
