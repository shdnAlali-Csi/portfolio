import 'package:flutter/material.dart';
import '../features/portfolio/presentation/portfolio_home_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shdn Alali Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0F1E),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF38BDF8),
          secondary: Color(0xFF22D3EE),
          surface: Color(0xFF101A33),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.w800, height: 1.2),
          headlineMedium: TextStyle(fontWeight: FontWeight.w700),
          titleLarge: TextStyle(fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(color: Color(0xFFC8D2F0)),
          bodyMedium: TextStyle(color: Color(0xFFAEB9D8)),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}
