import 'dart:async';

import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:LactoSafe/src/components/custom_text_field.dart';
import 'package:LactoSafe/src/controller/textfield_controller.dart';

import '../shared/app_settings.dart';

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
      body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Expanded(
                flex: 4,
                 child: ClipPath(
                    clipper: const ShapeBorderClipper(shape: CircleBorder()),
                    clipBehavior: Clip.hardEdge,
                    child: userFoodImage != null
                        ? Image.file(userFoodImage!,
                            width: AppSettings.screenWidth,
                            height: AppSettings.screenHeight / 2,
                            fit: BoxFit.cover)
                        : Container(
                            width: AppSettings.screenWidth / 4,
                            height: AppSettings.screenHeight / 2,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.grey, shape: BoxShape.circle),
                            child: const Text(
                              "Erro ao carregar imagem",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ),
               ),
              
              Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20), // Add horizontal padding
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          0, 0, 0, 0), // Add bottom padding
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
                    height: AppSettings.screenHeight / 14,
                    width: AppSettings.screenWidth / 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder()
                      ),
                      onPressed: () {
                        String foodName =
                            textFieldController.getGenericNameTextField();
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            title: Text(
                              "Confirmar cadastro do alimento com nome: ${foodName.toUpperCase()}?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.grey),
                            ),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancelar")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    showDialog(
                                      barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) {
                                          Timer(const Duration(seconds: 3), () {
                                            Navigator.popAndPushNamed(
                                                context, '/home');
                                          });
                    
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            title: Text(
                                              "Cadastro Realizado com sucesso!",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: AppColors.grey),
                                            ),
                                          );
                                        });
                                  },
                                  child: const Text("Confirmar"))
                            ],
                          ),
                        );
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
        ),
    );
  }
}
