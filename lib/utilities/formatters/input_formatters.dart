import 'package:intl/intl.dart';
class CFormatters{

static  String formatDate(String date){
   return  DateFormat('dd-MM-yyyy').format(DateTime.parse(date));
  }
  
}