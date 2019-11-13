class User{
  String username;

    User({
      this.username,
    });

    factory User.fromJson(Map<String, dynamic> parsedJson){
      Map json = parsedJson['username'];
      return User(
        username: json['username'],
      );
    }
}