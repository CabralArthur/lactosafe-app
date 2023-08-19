import 'package:flutter/material.dart';
import 'package:LactoSafe/src/view/welcome_page_contents.dart';
import 'package:LactoSafe/src/view/signin_page_view.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  static const routeName = '/WelcomePage';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int currentPage = 0;

  void goToNextPage() {
    setState(() {
      if (currentPage < 4) {
        currentPage++;
      } else {
        () {
          Navigator.pushNamed(context, '/SignIn');
        };
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget pageWidget;

    if (currentPage == 0) {
      pageWidget = PageOne();
    } else if (currentPage == 1) {
      pageWidget = PageTwo();
    } else if (currentPage == 2) {
      pageWidget = PageThree();
    } else if (currentPage == 3) {
      pageWidget = PageFour();
    } else if (currentPage == 4) {
      pageWidget = PageFive();
    } else {
      throw Exception("Invalid currentPage value: $currentPage");
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          pageWidget, // Use PageOne as the main content
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                  child: SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/SignIn');
                      },
                      child: const Text(
                        "Pular",
                        style: TextStyle(
                          color: Color.fromARGB(221, 63, 62, 62),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: SizedBox(
                    width: 100,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        goToNextPage();
                      },
                      child: const Text(
                        'Avançar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
