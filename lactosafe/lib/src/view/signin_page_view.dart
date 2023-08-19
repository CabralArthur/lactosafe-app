import 'package:LactoSafe/src/controller/textfield_controller.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:flutter/material.dart';
import 'package:LactoSafe/src/components/custom_text_field.dart';
import 'package:LactoSafe/src/controller/singin_page_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static const routeName = '/SignIn';

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
                  color: Colors.white, child: Image.asset(AppImages.logo)),
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
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Email
                      CustomTextField(
                        icon: Icons.email,
                        label: 'Email',
                        isObscure: false,
                        controller: textFieldController.emailController,
                      ),
                      //Senha
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha',
                        isObscure: true,
                        controller: textFieldController.passwordController,
                      ),
                      //Esqueceu a senha
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/resetPassword');
                          },
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(color: AppColors.orange),
                          ),
                        ),
                      ),

                      //Entrar
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          onPressed: () {
                            String email =
                                textFieldController.getEmailFromTextField();
                            String password =
                                textFieldController.getPasswordFromTextField();
                            var valueFromLogin = login(email, password);
                            // ignore: unrelated_type_equality_checks
                            if (valueFromLogin == true) {
                              Navigator.popAndPushNamed(context, "/home");
                            }
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),

                      const Padding(
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
                        onTap: () {
                          //Vai pro login com google
                        },
                        child: Image.asset(
                          AppImages.googleIcon,
                          width: 60,
                          height: 50,
                          fit: BoxFit.contain,
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
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Cadastre-se aqui!',
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.orange),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
