import 'package:flutter/material.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const routeName = '/signup';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(AppImages.logo),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          side: BorderSide(color: AppColors.grey),
                        ),
                        onPressed: () { },
                        child: const Text(
                          'Continue com o google',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(),
                      child: Text(
                        "Ou",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54 ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          side: BorderSide(color: AppColors.grey),
                        ),
                        onPressed: () {
                        },
                        child: const Text(
                          'Cadastre-se com e-mail',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}
