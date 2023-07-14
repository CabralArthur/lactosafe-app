import 'package:LactoSafe/src/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LactoSafe',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              elevation: 0, backgroundColor: Color(0xFFF8F8F8)),
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
        });
  }
}
