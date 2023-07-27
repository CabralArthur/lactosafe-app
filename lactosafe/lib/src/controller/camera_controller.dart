import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/info_food_model.dart';


XFile? image;
void takePicture(BuildContext context) async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      if(Foods.isEmpty) {
         InfoFood foodAnalyzed = InfoFood('', '', '', File(image!.path));
        Foods.add(foodAnalyzed);
      } else {
        Foods[0].setImage(File(image!.path));
      }
     
      
      if (context.mounted) {
        Navigator.popAndPushNamed(context, '/InfoAlimento');
      }
    }

  }



