import 'dart:io';

class InfoFood {
  String _nome;
  String _helpText;
  String _chanceLactose;
  File? _image;

  InfoFood(this._nome, this._helpText, this._chanceLactose, this._image);

  String get getFoodName => _nome;
  String get getHelpText => _helpText;
  String get getChanceLactose => _chanceLactose;
  File? get getImage => _image;

  void setImage(File? image) {
    _image = image;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  void setHelpText(String helpText) {
    _helpText = helpText;
  }
  void setChanceLactose(String chanceLactose) {
    _chanceLactose = chanceLactose;
  }


}


List<InfoFood> Foods = [];

