import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:LactoSafe/src/view/camera_view.dart';
import 'package:LactoSafe/src/view/food_list_view.dart';
import 'package:LactoSafe/src/view/settings_page.dart';
import 'package:LactoSafe/src/view/signin_page_view.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
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
    AppSettings.screenWidth = MediaQuery.of(context).size.width;
    AppSettings.screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LactoSafe',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          
          appBarTheme: AppBarTheme(
              elevation: 0, backgroundColor: AppColors.backgroundColor),
        ),
        initialRoute: SignIn.routeName,
        routes: {
          
          SignIn.routeName:(context) => const SignIn(),
          ResetPassword.routeName: (context) => const ResetPassword(),
          HomePage.routeName: (context) => const HomePage(),
          InfoFoodPage.routeName: (context) => const InfoFoodPage(),
          SettingsPage.routeName: (context) => const SettingsPage(),
          FoodListView.routeName: (context) => const FoodListView(),
          CameraView.routeName: (context) => const CameraView(),
        });
  }
}
