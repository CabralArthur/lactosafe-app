import 'package:flutter/material.dart';
import 'package:LactoSafe/src/view/info_alimento_view.dart';
import 'package:LactoSafe/src/view/signin_page.dart';
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
          primarySwatch: Colors.deepOrange,
          
          appBarTheme: const AppBarTheme(
              elevation: 0, backgroundColor: Color(0xFFF8F8F8)),
        ),
        initialRoute: SignIn.routeName,
        routes: {
          SignIn.routeName: (context) => const SignIn(),
          InfoAlimentoPage.routeName: (context) => const InfoAlimentoPage(),
        });
  }
}
