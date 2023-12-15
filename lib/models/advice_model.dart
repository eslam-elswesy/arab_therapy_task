
// this model modified as the income data in list with different shapes
// also to match the UI at home screen
class AdviceModel {
  int? id;
  String? mediaImage;
  String? topic;
  List<Items>? items;
  String? details;

  AdviceModel({this.id, this.mediaImage, this.topic, this.items, this.details});

  AdviceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaImage = json['media_image'];
    topic = json['topic'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        if(v["type"]=="paragraph"){// to solve showing details in home items
          details=v["data"];
        }
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['media_image'] = this.mediaImage;
    data['topic'] = this.topic;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  VideoDataModel? videoDataModel;
  String? type;
  List<String>? pointsData=[];
  String? data;

  Items({this.videoDataModel, this.type});

  Items.fromJson(Map<String, dynamic> json) {
    if( json['type'].toString()=="video"){
      videoDataModel = json['data'] != null ? new VideoDataModel.fromJson(json['data']) : null;
    }
    else if( json['type'].toString()=="points"){
      if (json['data'] != null) {
        pointsData = <String>[];
        json['data'].forEach((v) {
          pointsData!.add(v);
        });
      }
    }
    else{
      data = json['data'];
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.videoDataModel != null) {
      data['data'] = this.videoDataModel!.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}

class VideoDataModel {
  String? videoUrl;
  String? thumbnailUrl;

  VideoDataModel({this.videoUrl, this.thumbnailUrl});

  VideoDataModel.fromJson(Map<String, dynamic> json) {
    videoUrl = json['video_url'];
    thumbnailUrl = json['thumbnail_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_url'] = this.videoUrl;
    data['thumbnail_url'] = this.thumbnailUrl;
    return data;
  }
}