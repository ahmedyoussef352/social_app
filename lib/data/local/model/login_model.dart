class LoginModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  User? user;

  LoginModel({this.accessToken, this.tokenType, this.expiresIn, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"];
    tokenType = json["token_type"];
    expiresIn = json["expires_in"];
    user =
    // json["user"] == null ? null :
     User.fromJson(json["user"]);
  }
}

class User {
  dynamic id;
dynamic username;
  dynamic email;
  dynamic emailVerifiedAt;
  dynamic phone;
  dynamic createdAt;
  dynamic updatedAt;

 // User({this.id, this.username, this.email, this.emailVerifiedAt, this.phone, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    username = json["username"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    phone = json["phone"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }


}