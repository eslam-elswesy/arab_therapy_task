import 'package:flutter/material.dart';

class ApiResponse {
  int? statusCode;
  bool? successFlag;
  dynamic error;
  dynamic body;

  ApiResponse({@required this.statusCode, this.successFlag, this.body, this.error});
}

