class UserInfoModel {
  String? userId;
  String? createdAt;
  String? name;
  String? email;
  String? phoneNumber;
  String? country;
  String? calories;
  String? carb;
  String? protein;
  String? steps;
  String? currentCalories;
  String? currentSteps;
  String? currentCarbs;
  String? currentProtein;
  String? currentFat;
  String? currentWater;
  String? currentSleep;
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

  UserInfoModel(
      {this.userId,
        this.createdAt,
        this.name,
        this.email,
        this.phoneNumber,
        this.country,
        this.calories,
        this.carb,
        this.protein,
        this.steps,
        this.currentSteps,
        this.currentCalories,
        this.currentCarbs,
        this.currentProtein,
        this.currentFat,
        this.currentWater,
        this.currentSleep,
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
      });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    createdAt = json['created_at'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    country = json['country'];
    calories = json['calories']?.toString();
    carb = json['carb']?.toString();
    protein = json['protein']?.toString();
    currentCalories = json['current_calories']?.toString();
    currentSteps = json['current_steps']?.toString();
    steps = json['steps']?.toString();
    currentCarbs = json['current_carbs']?.toString();
    currentProtein = json['current_protein']?.toString();
    currentFat = json['current_fat']?.toString();
    currentWater = json['current_water']?.toString();
    currentSleep = json['current_sleep']?.toString();
    fat = json['fat']?.toString();
    height = json['height']?.toString();
    weight = json['weight']?.toString();
    gender = json['gender'];
    age = json['age']?.toString();
    goal = json['goal'];
    userType = json['user_type'];
    authType = json['auth_type'];
    subscriptionType = json['subscription_type'];
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
    return data;
  }
}