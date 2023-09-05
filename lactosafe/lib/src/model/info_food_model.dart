import 'dart:io';

class FoodModel {
  String nome;
  String? helpText;
  double? lactoseRisk;
  String? lactoseRiskStr;
  double? chanceAlimento;
  File? userFoodImage;
  String? imageUrl;

  FoodModel(
      {required this.nome,
      this.imageUrl,
      this.helpText,
      this.chanceAlimento,
      this.lactoseRisk,
      this.lactoseRiskStr,
      this.userFoodImage});

  String get getFoodName => nome;
  String? get getHelpText => helpText;
  double? get getLactoseRisk => lactoseRisk;
  String? get getLactoseRiskStr => lactoseRiskStr;
  double? get getChanceAlimento => chanceAlimento;
  File? get getImage => userFoodImage;
  String? get getImageUrl => imageUrl;

  void setImage(File? newImage) {
    userFoodImage = newImage;
  }

  void setNome(String newNome) {
    nome = newNome;
  }

  void setHelpText(String newhelpText) {
    helpText = newhelpText;
  }

  void setLactoseRisk(double newLactoseRisk) {
    lactoseRisk = newLactoseRisk;
  }

  void setLactoseRiskStr(String newlactoseRiskString) {
    lactoseRiskStr = newlactoseRiskString;
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(nome: map["nome"], chanceAlimento: map["porcentagem"], imageUrl: map["imageUrl"]);
  }

  factory FoodModel.recordFromMap(Map<String, dynamic> map) {
    return FoodModel(nome: map["nome"], lactoseRisk: map["risco_float"], lactoseRiskStr: map["risco_str"], imageUrl: map["imageUrl"], helpText: map["texto_ajuda"]);
  }
}

