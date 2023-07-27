import 'package:LactoSafe/src/controller/sigIn_page_controller.dart';
import 'package:LactoSafe/src/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  static const routeName = '/resetPassword';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Form(
            key: _formkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Informe o Email da conta'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CustomTextField(
                      icon: Icons.email,
                      label: 'Email',
                      validator: (value) => validateForm(value),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Voltar',
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => submitForm(_formkey, context),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Enviar'),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ), 
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
