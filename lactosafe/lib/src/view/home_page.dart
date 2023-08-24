import 'package:LactoSafe/src/components/photo_widget.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:LactoSafe/src/view/home_page_view.dart';
import 'package:LactoSafe/src/view/map_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List _pages = [HomePageBody(), MapPage()];
  int _indiceAtual = 0;

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: AppSettings.screenHeight/12,
          leading: PhotoWidget(picture: null, height: 4, width: 4),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: 
                InkWell(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/settings');
                  },
                  child: 
                    SvgPicture.asset(AppImages.menuIcon, height: AppSettings.screenHeight/15,),
                  
                ),
              
            ),
          
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
                Navigator.pushNamed(context, '/camera');
                
              },
              backgroundColor: AppColors.orange,
              child: Image.asset(AppImages.cameraIcon)
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
        unselectedItemColor: AppColors.grey,
        selectedItemColor: AppColors.orange,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: 
              Image.asset(AppImages.homeIcon),

              label: 'Home'),
          BottomNavigationBarItem(
              icon: 
              Image.asset(AppImages.mapIcon),

              label: 'Mapa')
        ],
      ),
    );
  }
}
