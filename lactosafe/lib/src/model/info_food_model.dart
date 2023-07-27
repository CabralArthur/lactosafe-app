import 'dart:io';

import 'package:image_picker/image_picker.dart';

class InfoFood {
  final String _nome;
  final String _helpText;
  final String _chanceLactose;
  File? _image;

  InfoFood(this._nome, this._helpText, this._chanceLactose, this._image);

  String get getFoodName => _nome;
  String get getHelpText => _helpText;
  String get getChanceLactose => _chanceLactose;
  File? get getImage => _image;

  set setImage(File? image) {
    _image = image;
  }
}

List<InfoFood> Foods = [];

//InfoFood('Teste', 'Text', '8', null)