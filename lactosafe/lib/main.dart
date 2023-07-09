import 'package:flutter/material.dart';
import 'package:lactosafe/src/view/home_page_view.dart';

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
              elevation: 0,
              backgroundColor: Color.fromARGB(239, 249, 249, 249)),
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
        });
  }
}
