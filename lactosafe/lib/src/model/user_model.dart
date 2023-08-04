import 'dart:io';

class User {
  File? _picture;

  User(this._picture);


  File? get getPicture => _picture;

  void setImage(File? image) {
    _picture = image;
  }

}

List<User> userPicture = []; 