import 'package:flutter/material.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:LactoSafe/src/components/custom_text_field.dart';
import 'package:LactoSafe/src/controller/textfield_controller.dart';

class MissingFoodRegistration extends StatefulWidget {
  const MissingFoodRegistration({Key? key}) : super(key: key);
  static const routeName = '/MissingFoodRegistration';

  @override
  State<MissingFoodRegistration> createState() =>
      _MissingFoodRegistrationState();
}

class _MissingFoodRegistrationState extends State<MissingFoodRegistration> {
  final TextFieldController textFieldController = TextFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.logo,
                width: 800,
                height: 800,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                  horizontal: 20), // Add horizontal padding
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(0, 0, 0, 0), // Add bottom padding
                child: CustomTextField(
                  icon: Icons.add,
                  label: 'Nome do Alimento',
                  controller: textFieldController.genericController,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  String foodName =
                      textFieldController.getGenericNameTextField();
                },
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
