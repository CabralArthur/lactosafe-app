import 'package:LactoSafe/src/controller/camera_controller.dart';
import 'package:LactoSafe/src/shared/app_camera_source.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class CameraView extends StatelessWidget {
  static const routeName = '/camera';

  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: AppColors.orange,
          iconSize: 40.0,
          alignment: Alignment.topLeft,
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              onPressed: () {
                CameraFoodPicture().takePicture(
                    context: context, sourceType: CameraSource.camera);
              },
              child: SizedBox(
                height: AppSettings.screenHeight / 10,
                width: AppSettings.screenWidth / 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.cameraIcon),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text("Camera")
                  ],
                ),
              )),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Ou',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
                fontSize: 20),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                GalleryFoodPicture().takePicture(
                    context: context, sourceType: CameraSource.gallery);
              },
              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              child: SizedBox(
                height: AppSettings.screenHeight / 10,
                width: AppSettings.screenWidth / 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.galleryIcon),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text("Galeria")
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
