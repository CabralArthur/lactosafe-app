import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:flutter/material.dart';

class BeginingPage extends StatefulWidget {
  const BeginingPage({super.key});
  static const routeName = '/BeginingPage';

  @override
  State<BeginingPage> createState() => _BeginingPageState();
}

class _BeginingPageState extends State<BeginingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.logoLetterless,
                width: 800,
                height: 800,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Olá, user!",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(221, 63, 62, 62),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "Ficamos feliz em te ver como parte da nossa ",
                            ),
                            TextSpan(
                              text: "família",
                              style: TextStyle(
                                color: Colors.deepOrange,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ". Para podermos trazer uma experiência melhor em nosso aplicativo gostariamos de saber mais sobre você.",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(0, 0, 20, 20), // Add padding here
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Personalizar',
                    style: TextStyle(fontSize: 16),
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
