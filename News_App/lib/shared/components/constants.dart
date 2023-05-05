import 'package:intl/intl.dart';





void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? token;

String? uId;


String getDate(formattedString) {
  DateTime dateTime = DateTime.parse(formattedString);
  String date = DateFormat.yMMMd().format(dateTime);
  return date;
}