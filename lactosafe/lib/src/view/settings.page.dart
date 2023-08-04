import 'package:LactoSafe/src/components/photo_widget.dart';
import 'package:LactoSafe/src/controller/camera_controller.dart';
import 'package:LactoSafe/src/shared/app_camera_source.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  static const routeName = '/settings';
  


  @override 
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil', style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w600),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          }, 
          icon: const Icon(
            Icons.arrow_back_rounded, ),
            color: AppColors.orange,
            iconSize: 40.0,
           alignment: Alignment.topLeft,),
           actions: [
            PhotoWidget(picture: AppImages.logo2)
           ],
           ), 

           
           body: Center (child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            PhotoWidget(
              picture: null, height: AppSettings.screenHeight/4, width: AppSettings.screenWidth/2,),

              const SizedBox(height: 10,),

              TextButton(onPressed: () {
                takePicture(context, CameraSouce.gallery, false);
                setState(() {
                  
                });
                }, 
                child: Text(
                  "Trocar Foto", 
                  style: TextStyle(color: AppColors.grey),)),

              Padding( padding: EdgeInsets.only(right: AppSettings.screenWidth/8, left: AppSettings.screenWidth/8), child: Divider(height: 3.0, thickness: 1.5,)),

              SizedBox(height: AppSettings.screenHeight/25,),

              TextButton(onPressed: () {}, child: Text("Redefinir Senha", style: TextStyle(color: AppColors.orange, fontSize: 20.0, fontWeight: FontWeight.w600),)),

              ],
            )
          )
    );
  }
}