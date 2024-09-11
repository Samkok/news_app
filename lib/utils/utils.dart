import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {

  static String dateFormat(String date) {
    // Parse the original date string into a DateTime object
    DateTime parsedDate = DateTime.parse(date);

    // Format the parsed date into the desired format
    String formattedDate = DateFormat('dd MMM, yyyy').format(parsedDate);
    return formattedDate;
  }

  static String dateFormatToDB(DateTime dateTime) {
    return DateFormat('yyyyMMdd').format(dateTime);
  }

  static DateTime convertStringToDateTime(String date) {
    return DateTime.parse(date);
  }

  static bool checkIfBeforeNow(String date) {
    try {
      DateTime dateTime = DateTime.parse(date);
      DateTime now = DateTime.now();
      Duration diff = dateTime.difference(now);

      if (diff.inDays == 0) {
        return false;
      }
      return now.isAfter(dateTime);
    } catch (e) {
      Get.log(e.toString());
    }
    return false;
  }

}