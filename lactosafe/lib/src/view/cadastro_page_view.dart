import 'package:flutter/material.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  static const routeName = '/Cadastro';

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
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
                          borderRadius: BorderRadius.circular(30.0),
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
                          borderRadius: BorderRadius.circular(30.0),
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
