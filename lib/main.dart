import 'package:expense_tracker/common/color_extension.dart';
import 'package:expense_tracker/view/login/welcome_view.dart';
import 'package:expense_tracker/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintrac',
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: TColor.primary,
          surface: TColor.gray80,
          primary: TColor.primary,
          primaryContainer: TColor.gray60,
          secondary: TColor.secondary, 
          ),
      ),
      home: const MainTabView(),
    );
  }
}
