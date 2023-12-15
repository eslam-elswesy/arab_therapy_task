import 'package:flutter/material.dart';

//convert from string to color
Color stringConvertColor(String color) {
  if (color == null || color == "" || color.contains("#") == false)
    return Colors.transparent;
  color = color.replaceAll("#", "");
  var converted;
  if (color.length == 6) {
    converted = Color(int.parse("0xFF$color"));
  } else if (color.length == 8) {
    converted = Color(int.parse("0x$color"));
  }
  return converted;
}

//convert from color to string
String colorConvertString(Color color) {
  String colorString = color.toString(); // Color(0x12345678)
  String valueString =
      colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
  // int value = int.parse(valueString, radix: 16);
  String value = valueString.replaceFirst("ff", "#");
  return value;
}

//get list of String from ListOfColors

// List<String> convertColorList(List<Color> colors)
// {
//   List<String> list=[];
//   if(colors.isEmpty)return null;
//   for(final i in colors)
//   {
//     list.add(colorConvertString(i));
//   }
//   return list;
// }
