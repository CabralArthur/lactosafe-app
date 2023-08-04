import 'dart:io';

import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:flutter/material.dart';

class PhotoWidget extends StatefulWidget {
  final String? picture;
  final double height;
  final double width;
  final bool isUser;
  const PhotoWidget({super.key, required this.picture, this.height=100, this.width=100, this.isUser = true});
  


  @override 
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 5.0), 
            child: SizedBox(
              width: widget.width,
              height: widget.height,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: widget.picture!= null ?  AssetImage(
                      widget.picture as String) : AssetImage(AppImages.userDefault)
                      ),
                    ),
                  ),
      ),
                  
    );
  }
}