import 'package:flutter/material.dart';
import 'package:lactosafe/src/view/camera_view.dart';
import 'package:lactosafe/src/view/home_page_view.dart';
import 'package:lactosafe/src/view/map_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List _pages = [HomePageBody(), CameraPage(), MapPage()];
  int _indiceAtual = 0;

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
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                color: Colors.orange,
              )
            ],
          )
        ],
      ),
      body: _pages.elementAt(_indiceAtual),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa')
        ],
      ),
    );
  }
}
