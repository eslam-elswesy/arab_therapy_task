import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';

class AppConstants{

  static const String fontFamily='din_ar';
  static const List<String> dialogTypes= ["confirm", "warning"];
  static const List<String> tokenTypes= [ "unknown", "unSubscribed", "subscribed"];

  static List<String> genderTypes= [StringsAssetsConstants.male, StringsAssetsConstants.female];
  static List<String> targetTypes= [StringsAssetsConstants.target_option1, StringsAssetsConstants.target_option2, StringsAssetsConstants.target_option3];
  static List<String> targetTypesHint= [StringsAssetsConstants.target_option1_hint, StringsAssetsConstants.target_option2_hint, StringsAssetsConstants.target_option3_hint];
  static List<String> activeRateTypes= [StringsAssetsConstants.active_rate_option1, StringsAssetsConstants.active_rate_option2, StringsAssetsConstants.active_rate_option3, StringsAssetsConstants.active_rate_option4];

  // 1 - January
  static const List<String> Months =[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];



}