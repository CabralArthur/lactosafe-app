import 'package:LactoSafe/src/view/signin_page_view.dart';
import 'package:LactoSafe/src/view/camera_view.dart';
import 'package:LactoSafe/src/view/home_page.dart';
import 'package:LactoSafe/src/view/info_food_view.dart';
import 'package:LactoSafe/src/view/reset_password_view.dart';
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
          primarySwatch: Colors.deepOrange,
          
          appBarTheme: const AppBarTheme(
              elevation: 0, backgroundColor: Color(0xFFF8F8F8)),
        ),
        initialRoute: SignIn.routeName,
        routes: {
          
          SignIn.routeName:(context) => const SignIn(),
          ResetPassword.routeName: (context) => const ResetPassword(),
          HomePage.routeName: (context) => const HomePage(),
          InfoFoodPage.routeName: (context) => const InfoFoodPage(),
          CameraPage.routeName: (context) => const CameraPage(),

        });
  }
}
