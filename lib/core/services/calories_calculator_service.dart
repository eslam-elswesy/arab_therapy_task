class CaloriesCalculatorService {
  static CaloriesCalculatorModel caloriesCalculatorByUserInfo(
      UserPersonalInfoModel personalInfo) {
    double metabolicRate = _calculateMetabolicRate(personalInfo);
    double maintenanceCalories = _calculateMaintenanceCalories(personalInfo, metabolicRate);
    double calories = _calculateTotalCalories(personalInfo, maintenanceCalories);
    double protein = _calculateProtein(personalInfo);
    double fat = _calculateFat(calories);
    double carbs = _calculateCarbs(calories, fat, protein);

    return CaloriesCalculatorModel(
      calories: calories,
      fats: fat,
      protein: protein,
      carb: carbs,
    );
  }

  static double _calculateMetabolicRate(UserPersonalInfoModel personalInfo) {
    return personalInfo.gender == Gender.male
        ? (personalInfo.weight * 10 + personalInfo.height * 6.25 - personalInfo.age * 5) + 5
        : (personalInfo.weight * 10 + personalInfo.height * 6.25 - personalInfo.age * 5) - 161;
  }

  static double _calculateMaintenanceCalories(
      UserPersonalInfoModel personalInfo, double metabolicRate) {
    switch (personalInfo.activeRate) {
      case 4:
        return metabolicRate * 1.75;
      case 3:
        return metabolicRate * 1.55;
      case 2:
        return metabolicRate * 1.375;
      default:
        return metabolicRate * 1.2;
    }
  }

  static double _calculateTotalCalories(
      UserPersonalInfoModel personalInfo, double maintenanceCalories) {
    switch (personalInfo.targetIndex) {
      case 0:
        return maintenanceCalories + 500;
      case 2:
        return maintenanceCalories - 500;
      default:
        return maintenanceCalories;
    }
  }

  static double _calculateProtein(UserPersonalInfoModel personalInfo) {
    return personalInfo.weight >= 100
        ? personalInfo.weight * 1.6
        : personalInfo.weight * 1.8;
  }

  static double _calculateFat(double calories) {
    return (0.25 * calories) / 9;
  }

  static double _calculateCarbs(double calories, double fat, double protein) {
    return (calories - ((fat * 9) + (protein * 4))) / 4;
  }
}

class CaloriesCalculatorModel {
  final double calories;
  final double fats;
  final double protein;
  final double carb;

  CaloriesCalculatorModel({
    required this.calories,
    required this.fats,
    required this.protein,
    required this.carb,
  });
}

class UserPersonalInfoModel {
  final int height;
  final int weight;
  final int age;
  final int activeRate;
  final Gender gender;
  final int targetIndex;

  UserPersonalInfoModel({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.targetIndex,
    required this.activeRate,
  });
}

enum Gender {
  male,
  female,
}


