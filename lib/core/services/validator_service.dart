import 'dart:io';

import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:get/get.dart';
import 'package:string_validator/string_validator.dart';

class AppValidatorService {
  static String? validNullable(var x, {String? customMessage}) {
    if (x == null||x=="") return customMessage ?? StringsAssetsConstants.general_validation;
    return null;
  }

  static String? validImages(File x, int maxSize, {String? customMessage}) {
    if (validNullable(x) == null) {
      final bytes = x.readAsBytesSync().lengthInBytes;
      final kb = bytes / 1024;
      final mb = kb / 1024;
      return mb < maxSize ? null : customMessage ?? StringsAssetsConstants.general_validation;
    }
    return null;
  }

  static String? validEmail(String email, {String? customMessage}) {
    if(email.isEmpty){
      return "لا يمكن ترك حقل البريد الإلكتروني فارغًا";
    }
    if (!isEmail(email)) {
      return customMessage ?? StringsAssetsConstants.general_validation;
    }
    return null;
  }

  static String? validName(String name, {String? customMessage}) {
    if(name.isEmpty){
      return "لا يمكن ترك حقل الاسم فارغًا";
    }
    if (isNumeric(name) || !isLength(name, 2)) {
      return customMessage ?? StringsAssetsConstants.general_validation;
    }
    return null;
  }

  static String? validEmpty(String name, {String? customMessage}) {
    if (!isLength(name, 1)) {
      return customMessage ?? StringsAssetsConstants.general_validation;
    }
    return null;
  }

  static String? validUserName(String userName, {String? customMessage}) {
    if (!isAlpha(userName) || !isLength(userName, 5)) {
      return customMessage ?? StringsAssetsConstants.general_validation;
    }
    return null;
  }

  static String? validNumber(String number, {String? customMessage}) {
    if (!isNumeric(number)) {
      return customMessage ?? StringsAssetsConstants.general_validation;
    }
    return null;
  }
  static String? validPositiveNumber(String number, {String? customMessage}) {
    if (!isNumeric(number)||int.parse(number)<1) {
      return customMessage ?? StringsAssetsConstants.general_validation;
    }
    return null;
  }

  static String? validComment(String comment, {String? customMessage}) {
    if (!isLength(comment, 15)) {
      return customMessage ?? StringsAssetsConstants.general_validation;
    }
    return null;
  }

  static String? validLenth(String data,int lenth, {String? customMessage}) {
    if (!isLength(data, lenth,lenth)) {
      return customMessage ?? StringsAssetsConstants.general_validation;
    }
    return null;
  }



  static String? validPhone(String phone, {String? customMessage}) {
    if(phone.isEmpty){
      return "لا يمكن ترك حقل رقم الجوال فارغًا";
    }
    if (!isLength(phone, 9,9)) {
      return customMessage ?? StringsAssetsConstants.general_validation;
    }
    if (RegExp(r"^[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$").hasMatch(phone) != true) {
      return customMessage ?? StringsAssetsConstants.general_validation;
    }
    return null;
  }

  static String? validPassword(String password, {String? customMessage}) {
    if(password.isEmpty){
      return "لا يمكن ترك حقل كلمة المرور فارغًا";
    }
    // if(!validatePassword(password)){
    //   return "كلمة المرور التي أدخلتها ضعيفة جدًا.";
    // }
    if (!isLength(password, 8)) {
      return customMessage ?? StringsAssetsConstants.general_validation;
    }
    return null;
  }

  static bool validatePassword(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';//TODO []
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String? validConfPass(String confPassword, String password, {String? customMessage}) {
    if(confPassword.isEmpty){
      return "لا يمكن ترك حقل  تأكيد كلمة المرور فارغًا";
    }
    if (!equals(password, confPassword)) {
      return customMessage ?? StringsAssetsConstants.general_validation;
    }
    return null;
  }

  static String? validAge(String age, int minAge, {String? customMessage}) {
    if (validNumber(age) == null) {
      if (int.parse(age) < minAge) return customMessage ?? "dataValidation".tr;
    }
    return null;
  }

  static String? validCompare(String number1, String number2, CompareType type, {String? customMessage}) {
    if (validNumber(number1) == null && validNumber(number2) == null) {
      if (type == CompareType.greater && !(int.parse(number1) > int.parse(number2))) {
        return customMessage ?? StringsAssetsConstants.general_validation;
      }
      if (type == CompareType.less && !(int.parse(number1) < int.parse(number2))) {
        return customMessage ?? StringsAssetsConstants.general_validation;
      }
      if (type == CompareType.greaterEqual && !(int.parse(number1) >= int.parse(number2))) {
        return customMessage ?? StringsAssetsConstants.general_validation;
      }
      if (type == CompareType.lessEqual && !(int.parse(number1) <= int.parse(number2))) {
        return customMessage ?? StringsAssetsConstants.general_validation;
      }
      if (type == CompareType.equal && !(int.parse(number1) == int.parse(number2))) {
        return customMessage ?? StringsAssetsConstants.general_validation;
      }
    } else {
      return validNumber(number1) ?? validNumber(number2);
    }
    return null;
  }

  static String getErrorString(Map<String, dynamic> errors, String fieldName) {
    if (errors.containsKey(fieldName)) return errors[fieldName][0].toString();
    return "";
  }
}

enum CompareType {
  greater,
  less,
  greaterEqual,
  lessEqual,
  equal,
}
