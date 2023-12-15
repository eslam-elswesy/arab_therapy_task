class UserModel {
  String? userId;
  String? createdAt;
  String? name;
  String? email;
  String? phoneNumber;
  String? country;
  String? calories;
  String? carb;
  String? protein;
  String? currentCalories;
  String? currentCarbs;
  String? currentProtein;
  String? currentFat;
  String? currentWater;
  String? fat;
  String? height;
  String? weight;
  String? gender;
  String? age;
  String? goal;
  String? userType;
  String? authType;
  List<String>? allergy;
  List<String>? injury;
  List<String>? measurements;
  String? subscriptionType;
  String? token;

  UserModel(
      {this.userId,
        this.createdAt,
        this.name,
        this.email,
        this.phoneNumber,
        this.country,
        this.calories,
        this.carb,
        this.protein,
        this.currentCalories,
        this.currentCarbs,
        this.currentProtein,
        this.currentFat,
        this.currentWater,
        this.fat,
        this.height,
        this.weight,
        this.gender,
        this.age,
        this.goal,
        this.userType,
        this.authType,
        this.allergy,
        this.injury,
        this.measurements,
        this.subscriptionType,
        this.token,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    createdAt = json['created_at'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    country = json['country'];
    calories = json['calories'];
    carb = json['carb'];
    protein = json['protein'];
    currentCalories = json['current_calories'];
    currentCarbs = json['current_carbs'];
    currentProtein = json['current_protein'];
    currentFat = json['current_fat'];
    currentWater = json['current_water'];
    fat = json['fat'];
    height = json['height'];
    weight = json['weight'];
    gender = json['gender'];
    age = json['age'];
    goal = json['goal'];
    userType = json['user_type'];
    authType = json['auth_type'];
    subscriptionType = json['subscription_type'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['country'] = this.country;
    data['calories'] = this.calories;
    data['carb'] = this.carb;
    data['protein'] = this.protein;
    data['current_calories'] = this.currentCalories;
    data['current_carbs'] = this.currentCarbs;
    data['current_protein'] = this.currentProtein;
    data['current_fat'] = this.currentFat;
    data['current_water'] = this.currentWater;
    data['fat'] = this.fat;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['goal'] = this.goal;
    data['user_type'] = this.userType;
    data['auth_type'] = this.authType;
    data['allergy'] = this.allergy;
    data['injury'] = this.injury;
    data['measurements'] = this.measurements;
    data['subscription_type'] = this.subscriptionType;
    data['token'] = this.token;
    return data;
  }
}