import 'package:LactoSafe/src/controller/cadastro_controller.dart';
import 'package:flutter/material.dart';
import 'package:LactoSafe/src/components/custom_text_field.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:LactoSafe/src/controller/textfield_controller.dart';
import 'package:LactoSafe/src/components/CustomDropdown.dart';

class CadastroInformation extends StatefulWidget {
  const CadastroInformation({Key? key}) : super(key: key);
  static const routeName = '/CadastroInformation';

  @override
  State<CadastroInformation> createState() => CadastroInformationState();
}

class CadastroInformationState extends State<CadastroInformation> {
  String selectedOption = 'Primária';

  final TextFieldController textFieldController = TextFieldController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImages.logo_letter_row),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Informações do usuário",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("E-mail"),
              ),
            ),
            CustomTextField(
              icon: Icons.email,
              label: "nome@dominio.com",
              controller: TextEditingController(),
              validator: (value) {
                return null;
              },
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Senha"),
              ),
            ),
            CustomTextField(
              icon: Icons.lock,
              label: "Insira sua senha",
              isObscure: true,
              controller: TextEditingController(),
              validator: (value) {
                return null;
              },
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Nome de usuário"),
              ),
            ),
            CustomTextField(
              icon: Icons.person,
              label: "Insira o nome de usuário",
              controller: TextEditingController(),
              validator: (value) {
                return null;
              },
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Endereço"),
              ),
            ),
            CustomTextField(
              icon: Icons.map,
              label: "Insira o seu endereço",
              controller: TextEditingController(),
              validator: (value) {
                return null;
              },
            ),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Índice de Intolerância"),
              ),
            ),
            const CustomDropdownWidget(
              options: ['Primária', 'Secundária', 'Congênita', 'Não sei'],
              initialOption: 'Primária',
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: () {
                String email = textFieldController.getEmailFromTextField();
                String password =
                    textFieldController.getPasswordFromTextField();
                String username = textFieldController.getGenericNameTextField();
                String endereco =
                    textFieldController.getEnderecoNameTextField();
                String tipoIntolerancia = selectedOption;
                Cadastro(email, password, username, endereco, tipoIntolerancia,
                    context);
              },
              child: const Text(
                'Concluir Cadastro',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

