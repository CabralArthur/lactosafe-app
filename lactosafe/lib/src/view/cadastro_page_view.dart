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
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: SizedBox( 
                height: 10,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      height: 100,
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: AppColors.grey),
                    ),
                  ),
                  child: Text(
                    'Cadastre com Email',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),

      // #### TEXTO "OU" #### 
          const Padding(
            padding: EdgeInsets.symmetric(),
            child: Text(
              "Ou",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54 ),
              
            ),

          ),


/*
          Container(
            margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 25*fem),
            child: Text(
              'Ou',
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'Roboto',
                fontSize: 18*ffem,
                fontWeight:  FontWeight.w400,
        
              ),
            ),
          ),
*/


//  ### SEGUNDO BOTÃO ####
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: ElevatedButton(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: AppColors.grey),
                  ),
                ),
                child: Text(
                  'Continue com o Google',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
