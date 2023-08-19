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
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.pageTwo,
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
                          TextSpan(text: "Escaneie "),
                          TextSpan(
                              text: "Alimentos",
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
                            text: "E tenha mais ",
                          ),
                          TextSpan(
                            text: "segurança ",
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          TextSpan(
                            text: "na hora de consumi-los",
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

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.pageThree,
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
                          TextSpan(
                              text: "Encontre ",
                              style: TextStyle(color: Colors.deepOrange)),
                          TextSpan(
                              text: "Produtos e recomendações",
                              style: TextStyle(
                                  color: Color.fromARGB(221, 63, 62, 62))),
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
                            text: "Para lhe ",
                          ),
                          TextSpan(
                            text: "ajudar ",
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          TextSpan(
                            text:
                                "com as substiuições de alimentos da sua dieta com restrições a lactose",
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

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              AppImages.pageFour,
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
                          TextSpan(text: "Encontre "),
                          TextSpan(
                              text: "lugares próximos ",
                              style: TextStyle(color: Colors.deepOrange)),
                          TextSpan(text: "a você "),
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
                            text: "Sejam ",
                          ),
                          TextSpan(
                            text: "restaurantes ou supermercados ",
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          TextSpan(
                            text: "o Lactosafe tornará sua busca mais fácil",
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

class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.pageTwo,
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
                          TextSpan(
                              text: "Avaliações ",
                              style: TextStyle(color: Colors.deepOrange)),
                          TextSpan(
                            text: "e comentários",
                          ),
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
                            text:
                                "Veja o que as pessoas tem a dizer sobre restaurantes e estabelecimentos. ",
                          ),
                          TextSpan(
                            text: "Você pode contribuir também! ",
                            style: TextStyle(
                              color: Colors.deepOrange,
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
