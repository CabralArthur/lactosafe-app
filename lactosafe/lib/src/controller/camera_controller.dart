import 'dart:io';
import 'package:LactoSafe/src/model/user_model.dart';
import 'package:LactoSafe/src/shared/app_camera_source.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/info_food_model.dart';


XFile? image;
void takePicture(BuildContext context, CameraSouce sourceType, bool isFood) async {

    if (sourceType == CameraSouce.camera) {

      image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(isFood & (image != null)){
        // ignore: use_build_context_synchronously
        settingFoodImage(context);
       
      } 
      

    } else {
        image = await ImagePicker().pickImage(source: ImageSource.gallery);

         if(isFood & (image != null)){
          // ignore: use_build_context_synchronously
          settingFoodImage(context);
       
        } else {
          settingUserPicture();
        }
        
      }

}

void settingFoodImage(BuildContext context) {
   if(Foods.isEmpty) {
          InfoFood foodAnalyzed = InfoFood('', '', 0, File(image!.path));
          Foods.add(foodAnalyzed);
    } else {
      Foods[0].setImage(File(image!.path));
    }
          
    if (context.mounted) {
      Navigator.popAndPushNamed(context, '/InfoAlimento');
    }

}

void settingUserPicture() {
  if(userPicture.isEmpty) {
        User profilePicture = User(File(image!.path));
        userPicture.add(profilePicture);
  } else {
        userPicture[0].setImage(File(image!.path));
      }
        
}