import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_gemini/config/router/app_router.dart';
import 'package:flutter_gemini/config/theme/app_theme.dart';

Future<void> main() async {
  AppTheme.setSystemUIOverlayStyle(isDarkMode: true);

  await dotenv.load(fileName: ".env");

  debugPrint(dotenv.env['ENDPOINT_API']);

  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkMode: true).getTheme(),
    );
  }
}
