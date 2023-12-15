class ImageModel {
  String? url;
  String? title;
  int? user;
  String? description;
  int? id;

  ImageModel({this.url, this.title, this.user, this.description, this.id});

  ImageModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    user = json['user'];
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['title'] = this.title;
    data['user'] = this.user;
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }
}