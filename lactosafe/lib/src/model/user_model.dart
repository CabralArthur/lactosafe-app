
class User {
  late final int userId;
  late String? userName;
  
  User({required this.userId, this.userName});

  String? get getUserName => userName;
  int get getUserId => userId;

  void setUserName(String newUserName) {
    userName = newUserName;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(userId: map['userID'],);
  }

}

late final User userStore;