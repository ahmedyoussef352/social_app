class PostModel {
  Data? data;
  String? message;
  int? status;

  PostModel({this.data, this.message, this.status});

  PostModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    message = json["message"];
    status = json["status"];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> _data = <String, dynamic>{};
  //   if(data != null) {
  //     _data["data"] = data?.toJson();
  //   }
  //   _data["message"] = message;
  //   _data["status"] = status;
  //   return _data;
  // }
}

class Data {
  dynamic currentPage;
  List<dynamic>? data;
  dynamic firstPageUrl;
  dynamic from;
  dynamic lastPage;
  dynamic lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  dynamic path;
  dynamic perPage;
  dynamic prevPageUrl;
  dynamic to;
  dynamic total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json["current_page"];
    data = json["data"] ?? [];
    firstPageUrl = json["first_page_url"];
    from = json["from"];
    lastPage = json["last_page"];
    lastPageUrl = json["last_page_url"];
    links = json["links"] == null
        ? null
        : (json["links"] as List).map((e) => Links.fromJson(e)).toList();
    nextPageUrl = json["next_page_url"];
    path = json["path"];
    perPage = json["per_page"];
    prevPageUrl = json["prev_page_url"];
    to = json["to"];
    total = json["total"];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> _data = <String, dynamic>{};
  //   _data["current_page"] = currentPage;
  //   if(data != null) {
  //     _data["data"] = data;
  //   }
  //   _data["first_page_url"] = firstPageUrl;
  //   _data["from"] = from;
  //   _data["last_page"] = lastPage;
  //   _data["last_page_url"] = lastPageUrl;
  //   if(links != null) {
  //     _data["links"] = links?.map((e) => e.toJson()).toList();
  //   }
  //   _data["next_page_url"] = nextPageUrl;
  //   _data["path"] = path;
  //   _data["per_page"] = perPage;
  //   _data["prev_page_url"] = prevPageUrl;
  //   _data["to"] = to;
  //   _data["total"] = total;
  //   return _data;
  // }
}

class Links {
  dynamic url;
  dynamic label;
  dynamic active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    label = json["label"];
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["label"] = label;
    _data["active"] = active;
    return _data;
  }
}
