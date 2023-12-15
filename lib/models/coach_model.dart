class CoachModel {
  String? coachId;
  String? name;
  String? personalImage;
  // List<Null>? ratings;
  int? traineeCapacity;
  int? currentNumberOfTrainees;
  String? status;
  // List<Null>? conditions;
  List<Images>? images;
  List<SubscriptionPlans>? subscriptionPlans;
  bool? isAi;

  CoachModel(
      {this.coachId,
        this.name,
        this.personalImage,
        // this.ratings,
        this.traineeCapacity,
        this.currentNumberOfTrainees,
        this.status,
        // this.conditions,
        this.images,
        this.subscriptionPlans,
        this.isAi});

  CoachModel.fromJson(Map<String, dynamic> json) {
    coachId = json['coach_id'];
    name = json['name'];
    personalImage = json['personal_image'];
    // if (json['ratings'] != null) {
    //   ratings = <Null>[];
    //   json['ratings'].forEach((v) {
    //     ratings!.add(new Null.fromJson(v));
    //   });
    // }
    traineeCapacity = json['trainee_capacity'];
    currentNumberOfTrainees = json['current_number_of_trainees'];
    status = json['status'];
    // if (json['conditions'] != null) {
    //   conditions = <Null>[];
    //   json['conditions'].forEach((v) {
    //     conditions!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['subscription_plans'] != null) {
      subscriptionPlans = <SubscriptionPlans>[];
      json['subscription_plans'].forEach((v) {
        subscriptionPlans!.add(new SubscriptionPlans.fromJson(v));
      });
    }
    isAi = json['is_ai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coach_id'] = this.coachId;
    data['name'] = this.name;
    data['personal_image'] = this.personalImage;
    // if (this.ratings != null) {
    //   data['ratings'] = this.ratings!.map((v) => v.toJson()).toList();
    // }
    data['trainee_capacity'] = this.traineeCapacity;
    data['current_number_of_trainees'] = this.currentNumberOfTrainees;
    data['status'] = this.status;
    // if (this.conditions != null) {
    //   data['conditions'] = this.conditions!.map((v) => v.toJson()).toList();
    // }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.subscriptionPlans != null) {
      data['subscription_plans'] =
          this.subscriptionPlans!.map((v) => v.toJson()).toList();
    }
    data['is_ai'] = this.isAi;
    return data;
  }
}

class Images {
  String? beforeImage;
  String? afterImage;

  Images({this.beforeImage, this.afterImage});

  Images.fromJson(Map<String, dynamic> json) {
    beforeImage = json['beforeImage'];
    afterImage = json['afterImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beforeImage'] = this.beforeImage;
    data['afterImage'] = this.afterImage;
    return data;
  }
}

class SubscriptionPlans {
  String? duration;
  int? price;

  SubscriptionPlans({this.duration, this.price});

  SubscriptionPlans.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration'] = this.duration;
    data['price'] = this.price;
    return data;
  }
}