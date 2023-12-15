import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  static void postData({
    required String key,
    required value,
    required DataType type,
  }) {
    if (type != DataType.listOfString) {
      const FlutterSecureStorage().write(key: key, value: value.toString());
    } else {
      const FlutterSecureStorage().write(key: key, value: jsonEncode(value));
    }
  }

  static Future getData({
    required String key,
    required DataType type,
  }) async {
    String? value = await const FlutterSecureStorage().read(key: key);
    if (value != null) {
      if (type == DataType.int) return int.parse(value);
      if (type == DataType.double) return double.parse(value);
      if (type == DataType.string) return value;
      if (type == DataType.bool) return value.toLowerCase() == 'true';
      if (type == DataType.listOfString) return List<String>.from(jsonDecode(value));
    } else {
      return null;
    }
  }

  static removeData({required String key}) {
    const FlutterSecureStorage().delete(key: key);
  }
}

enum DataType {
  int,
  double,
  string,
  bool,
  listOfString,
}
