import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:flutter/material.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';

class MissingFood extends StatefulWidget {
  const MissingFood({super.key});
  static const routeName = '/missingPage';

  @override
  State<MissingFood> createState() => _MissingFoodState();
}

class _MissingFoodState extends State<MissingFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Image.asset(AppImages.missing_symbol),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(221, 39, 38, 38),
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: "Infelizmente, não conseguimos encontrar",
                            ),
                            TextSpan(
                              text: " o alimento registrado",
                              style: TextStyle(color: AppColors.orange),
                            ),
                            const TextSpan(text: "!"),
                            const TextSpan(text: "\n\n"),
                            TextSpan(
                              text:
                                  "Mas User, você pode nos ajudar a melhorar:",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.grey,
                              ),
                            ),
                            const TextSpan(text: "\n\n\n"),
                            TextSpan(
                              text: "Insira as informações ",
                              style: TextStyle(
                                color: AppColors.orange,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "sobre o alimento registrado. Que o resto é com a gente!",
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/MissingFoodRegistration');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: AppColors.grey)),
              ),
              child: Text(
                'Adicionar informações do alimento',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
