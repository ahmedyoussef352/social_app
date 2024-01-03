class UserModel {
  dynamic id;
  dynamic username;
  dynamic email;
  dynamic emailVerifiedAt;
  dynamic phone;
  // dynamic createdAt;
  // dynamic updatedAt;
  // dynamic media;
  // List<dynamic>? posts;
  // List<dynamic>? postLikes;
  // List<dynamic>? postComments;

  // UserModel({
  //   this.id,
  //   this.username,
  //   this.email,
  //   this.emailVerifiedAt,
  //   this.phone,
  //   this.createdAt,
  //   this.updatedAt,
  //   //this.media, this.posts, this.postLikes, this.postComments
  // });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    username = json["username"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    phone = json["phone"];
    // createdAt = json["created_at"];
    // updatedAt = json["updated_at"];
    // media = json["media"];
    // posts = json["posts"] ?? [];
    // postLikes = json["post_likes"] ?? [];
    // postComments = json["post_comments"] ?? [];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> _data = <String, dynamic>{};
  //   _data["id"] = id;
  //   _data["username"] = username;
  //   _data["email"] = email;
  //   _data["email_verified_at"] = emailVerifiedAt;
  //   _data["phone"] = phone;
  //   _data["created_at"] = createdAt;
  //   _data["updated_at"] = updatedAt;
  //   _data["media"] = media;
  //   if(posts != null) {
  //     _data["posts"] = posts;
  //   }
  //   if(postLikes != null) {
  //     _data["post_likes"] = postLikes;
  //   }
  //   if(postComments != null) {
  //     _data["post_comments"] = postComments;
  //   }
  //   return _data;
  // }
}
