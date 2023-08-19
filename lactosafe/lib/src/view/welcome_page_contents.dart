import 'package:flutter/material.dart';
import 'package:LactoSafe/src/shared/app_images.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(221, 63, 62, 62),
                        ),
                        children: [
                          TextSpan(text: "Seja bem vindo ao "),
                          TextSpan(
                              text: "Lactosafe",
                              style: TextStyle(color: Colors.deepOrange)),
                        ],
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
                            text: "Um aplicativo que trará lhe trará mais ",
                          ),
                          TextSpan(
                            text: "segurança ",
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          TextSpan(
                            text: "em relação a sua intolerancia a lactose",
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
      ],
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      // Your page content...
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      // Your page content...
    );
  }
}
