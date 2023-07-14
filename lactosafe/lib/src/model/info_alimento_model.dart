class InfoAlimento {
  final String _nome;
  final String _helpText;
  final String _chanceLactose;

  InfoAlimento(this._nome, this._helpText, this._chanceLactose,);

  String get getFoodName => _nome;
  String get getHelpText => _helpText;
  String get getChanceLactose => _chanceLactose;
}