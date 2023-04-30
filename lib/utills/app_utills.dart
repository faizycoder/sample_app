import 'package:intl/intl.dart';

class AppUtils{

  static  String getDate(String s) {
    DateTime tempDate =  DateFormat("yyyy-MM-dd").parse(s);
    final DateFormat formatter = DateFormat('MMM dd, yyyy');
    final String formatted = formatter.format(tempDate);
    return formatted;
  }
  static  String getDateTime(String s) {
    DateTime tempDate =  DateFormat("yyyy-mm-dd HH:mm:ss").parse(s);
    final DateFormat formatter = DateFormat('HH:mm');
    final String formatted = formatter.format(tempDate);
    return formatted;
  }
}