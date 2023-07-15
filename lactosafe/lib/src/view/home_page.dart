import 'dart:io';

import 'package:LactoSafe/src/controller/info_food_controller.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/view/home_page_view.dart';
import 'package:LactoSafe/src/view/map_page_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List _pages = [HomePageBody(), MapPage()];
  int _indiceAtual = 0;

  XFile? image;
  XFile? imageTemporary;

  void takePicture() async {
    imageTemporary = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      image = imageTemporary;
    });

    //teste Inviar informações de imagem
    if (image != null) {
      getFood(File(image!.path));
      //InfoFood food = InfoFood("Comida", "Texto de ajuda", "80", image);
      //Foods.add(food);
      //Navigator.popAndPushNamed(context, '/InfoAlimento');
    }
  }
  //teste

  void onTabTapped(int index) {
    setState(() {
      print(index);
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/InfoAlimento');
                    },
                    icon: const Icon(
                      Icons.menu,
                      size: 40.0,
                    ),
                    color: Colors.orange,
                  ),
                )
              ],
            )
          ],
        ),
        body: _pages.elementAt(_indiceAtual),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
            width: 85.0,
            height: 85.0,
            child: FittedBox(
                child: FloatingActionButton.large(
              onPressed: () {
                takePicture();
              },
              backgroundColor: const Color(0xFFF08648),
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 50.0,
              ),
            ))),
        bottomNavigationBar: SizedBox(
          height: 90,
          child: _getBottomNavigationBar(),
        ));
  }

  ClipRRect _getBottomNavigationBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
      child: BottomNavigationBar(
        iconSize: 30.0,
        backgroundColor: Colors.white,
        unselectedItemColor: const Color(0x991E1E1E),
        selectedItemColor: const Color(0xC1ED5500),
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map_outlined,
              ),
              label: 'Mapa')
        ],
      ),
    );
  }
}
