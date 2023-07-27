import 'package:LactoSafe/src/controller/singin_page_controller.dart';
import 'package:LactoSafe/src/view/begining_page.dart';
import 'package:flutter/material.dart';
import 'package:LactoSafe/src/components/custom_text_field.dart';
import 'package:LactoSafe/src/controller/textfield_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static const routeName = '/home';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextFieldController textFieldController = TextFieldController();

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
                   CustomTextField(
                    icon: Icons.email,
                    label: 'Email',
                    controller: textFieldController.emailController
                  ),
                  //Senha
                   CustomTextField(
                    icon: Icons.lock,
                    label: 'Senha',
                    isObscure: true,
                    controller: textFieldController.passwordController
                  ),
                  //Esqueceu a senha
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: () {}, 
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
                      onPressed: () {
                        String email = textFieldController.getEmailFromTextField();
                        String password = textFieldController.getPasswordFromTextField();
                        login(email, password);
                      }, 
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BeginingPage(),));
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
