import 'dart:io';
import 'package:LactoSafe/src/shared/app_camera_source.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class Picture {
  void takePicture({required BuildContext context, required CameraSource sourceType});
}

class CameraFoodPicture implements Picture {
  @override
  void takePicture({required BuildContext context, required CameraSource sourceType}) async {
    XFile? image;
    if (sourceType == CameraSource.camera) {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image != null) {
         if(context.mounted) {
         Navigator.popAndPushNamed(context, '/foodlist', arguments: File(image.path));
      }
      }
      
    } else {
      throw UnimplementedError("Ocorreu um erro. Tente novamente.");
    }
  }
}

class GalleryFoodPicture implements Picture {
  @override
  void takePicture({required BuildContext context, required CameraSource sourceType}) async {
    XFile? image;
    if (sourceType == CameraSource.gallery) {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image != null) {
        if(context.mounted) {
        Navigator.popAndPushNamed(context, '/foodlist', arguments: File(image.path));
      }

      }
      
    } else {
      throw UnimplementedError("Ocorreu um erro. Tente novamente.");
    }
  }
}
