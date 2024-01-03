class RegistrationModel {
  String? message;
  User? user;

  RegistrationModel({this.message, this.user});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> _data = <String, dynamic>{};
  //   _data["message"] = message;
  //   if(user != null) {
  //     _data["user"] = user?.toJson();
  //   }
  //   return _data;
  // }
}

class User {
  dynamic username;
  dynamic email;
  dynamic phone;
  dynamic updatedAt;
  dynamic createdAt;
  dynamic id;

  User(
      {this.username,
      this.email,
      this.phone,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    email = json["email"];
    phone = json["phone"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> _data = <String, dynamic>{};
  //   _data["username"] = username;
  //   _data["email"] = email;
  //   _data["phone"] = phone;
  //   _data["updated_at"] = updatedAt;
  //   _data["created_at"] = createdAt;
  //   _data["id"] = id;
  //   return _data;
  // }
}
