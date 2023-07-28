import 'package:flutter/material.dart';
import 'package:LactoSafe/src/components/custom_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static const routeName = '/sigIn';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Image.asset('/home/vboxuser/Desktop/Lacsafe/lactosafe-app/lactosafe/lib/src/img/lacsafelogo.png')          
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 50,

              ),
              
              decoration: const BoxDecoration(

                color: Colors.white,

                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45)
                )
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  //Email
                  const CustomTextField(
                    icon: Icons.email,
                    label: 'Email',
                  ),
                  //Senha
                  const CustomTextField(
                    icon: Icons.lock,
                    label: 'Senha',
                    isObscure: true,
                  ),
                  //Esqueceu a senha
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: () {
                      Navigator.pushNamed(context, '/resetPassword');
                    }, 
                    child: const Text('Esqueceu a senha?', 
                    style: TextStyle(
                      color: Colors.deepOrangeAccent), 
                      ),
                    ),
                  ),

                  //Entrar
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
                      ),
                      onPressed: () {}, 
                      child: const Text(
                        'Entrar', style: TextStyle(
                          fontSize: 18
                        ),),
                      
                      ),                      
                  ),
                  
                  const Padding (
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'ou',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold, 
                      ),
                    ),
                  ),
                  // GoogleButton
                  InkWell(
                    onTap: (){
                      //Vai pro login com google
                    },
                    child: Container(
                      child: Image.asset(
                        '/home/vboxuser/Desktop/Lacsafe/lactosafe-app/lactosafe/lib/src/img/google_icon1.png',
                        width: 60,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  ///CadastroButton
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Não possui uma conta?', 
                        style: TextStyle(fontSize: 15),
                      ),
                      TextButton(onPressed: (){}, 
                      child: const Text(
                        'Cadastre-se aqui!', 
                        style:  TextStyle(fontSize: 15, color: Colors.deepOrange),
                      )
                      ),
                    ],
                  )

                ],
              ),
            ),
          )
        ],
      ) 

    );
  }
}
