import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/top_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kouki Mori — Portfolio',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ja', ''),
      ],
      // そとたべ LP / nuidiary 系に寄せた暖色紙トーン
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC45C3E),
          surface: const Color(0xFFF6F0EA),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F0EA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6F0EA),
          foregroundColor: Color(0xFF1C1410),
          elevation: 0,
        ),
      ),
      home: const TopPage(),
    );
  }
}
