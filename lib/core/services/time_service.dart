import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeConverterService {


  static int diffBetweenTwoDatesInHours(String start, String end) {
    return DateTime.parse(end).difference(DateTime.parse(start)).inMinutes;
  }



//income from backend -> "2022-04-15T13:02:00Z" and the result would be "15/04/2022 4:02:00 PM"
  static String dateTimeFromUTC(String incomeDateTime) {
    return DateFormat.yMd("lang".tr).add_jm().format(
        DateFormat("yyyy-MM-dd hh:mm:ss")
            .parse(DateTime.parse(incomeDateTime).toUtc().toString()));
  }

  static String dayFromUTC(String incomeDateTime) {
    return DateFormat('EEEE',"lang".tr).format(DateTime.parse(incomeDateTime));
  }

  //income from backend -> "2022-04-15T13:02:00Z" and the result would be "15/04/2022 4:02:00 PM"
  static String dateOnlyFromUTC(String incomeDateTime) {

    DateTime dateParse =
    DateFormat("yyyy-MM-dd hh:mm:ss").parse(incomeDateTime.toString());
    String year = DateFormat.y("lang".tr).format(dateParse);
    String month = DateFormat.M("lang".tr).format(dateParse);
    String day = DateFormat.d("lang".tr).format(dateParse);
    return "lang".tr == "en" ? "$day/$month/$year" : "$year/$month/$day";
  }





  // from 2016-07-04 00:00:00.000 to utc 2022-04-15T13:02:00Z
  //without adding country zone
  static String convertDateToUTC(DateTime incomeDateTime) {
    return incomeDateTime.toUtc().toString().trim().replaceAll(" ", "T");
  }

  // convert from 2016-07-04 00:00:00.000 to Jul 4, 2016
  //without adding country zone
  static String convertFromDateToText(DateTime incomeDateTime) {
    String lang = "lang".tr;
    return DateFormat.yMMMd(lang).format(incomeDateTime);
  }

// if date is today or yesterday will be displyed as that if else will be like Jul 4, 2016
  static String displayDate(String incomeDateTime) {
    int minutes =
    diffBetweenTwoDatesInHours(incomeDateTime, DateTime.now().toString());
    if (minutes < 1440) {
      return "today".tr;
    } else if (minutes < 2880) {
      return "yesterday".tr;
    } else {
      String lang = "lang".tr;
      return DateFormat.yMMMd(lang).format(DateTime.parse(incomeDateTime));
    }
  }

}