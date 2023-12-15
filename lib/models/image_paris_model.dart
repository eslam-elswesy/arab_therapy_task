class ImageParisModel {
  int? id;
  String? afterImage;
  String? beforeImage;

  ImageParisModel({this.id, this.afterImage, this.beforeImage});

  ImageParisModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    afterImage = json['after_image'];
    beforeImage = json['before_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['after_image'] = this.afterImage;
    data['before_image'] = this.beforeImage;
    return data;
  }
}