import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? image;
  XFile? imageTemporary;

  void takePicture() async {
    imageTemporary = await ImagePicker().pickImage(source: ImageSource.camera);
    //if (image == null) return;

    setState(() {
      image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      Expanded(
          child: Container(
        child: image != null
            ? Image.file(File(image!.path),
                width: 200.0, height: 50.0, fit: BoxFit.fitWidth)
            : Image.asset("assets/images/cameraIcon.png"),
      )),
      Text('Clique no botão abaixo para tirar a foto'),
      IconButton(
          onPressed: takePicture,
          tooltip: 'Clique aqui',
          icon: Icon(
            Icons.camera,
            size: 30.0,
            semanticLabel: "Clique aqui",
          ))
    ])));
  }
}
