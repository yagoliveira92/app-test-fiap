import 'package:app_test_fiap/app/core/storage_adapter/local_database/manager/local_data_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_test_fiap/app/core/containers/injection_container.dart'
    as injection;
import 'package:app_test_fiap/app/core/containers/router_container.dart'
    as router;
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injection.init();
  final localDataManager = injection.dependency.get<LocalDataManager>();
  await localDataManager.start();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'UseDev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      routerConfig: router.getRoutes,
    );
  }
}
