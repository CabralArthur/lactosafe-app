import 'dart:io';

class FoodModel {
  String nome;
  String? helpText;
  double chanceLactose;
  File? image;

  FoodModel(
      {required this.nome,
      this.helpText,
      required this.chanceLactose,
      this.image});

  String get getFoodName => nome;
  String? get getHelpText => helpText;
  double get getChanceLactose => chanceLactose;
  File? get getImage => image;

  void setImage(File? newImage) {
    image = newImage;
  }

  void setNome(String nome) {
    nome = nome;
  }

  void setHelpText(String helpText) {
    helpText = helpText;
  }

  void setChanceLactose(double chanceLactose) {
    chanceLactose = chanceLactose;
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(nome: map["nome"], chanceLactose: map["porcentagem"]);
  }
}

