import 'package:image_picker/image_picker.dart';

class InfoFood {
  final String _nome;
  final String _helpText;
  final String _chanceLactose;
  XFile? _image;

  InfoFood(this._nome, this._helpText, this._chanceLactose, this._image);

  String get getFoodName => _nome;
  String get getHelpText => _helpText;
  String get getChanceLactose => _chanceLactose;
  XFile? get getImage => _image;

  set setImage(XFile? image) {
    _image = image;
  }
}

List<InfoFood> Foods = [];

//InfoFood('Teste', 'Text', '8', null)
