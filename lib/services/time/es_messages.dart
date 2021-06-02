 
import 'package:delivery_boy/services/time/lookup.dart';

/// Spanish Messages
class ArMessages implements LookupMessages {
  @override
  String prefixAgo() => 'منذ';
  @override
  String prefixFromNow() => 'من الآن';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'لحظة';
  @override
  String aboutAMinute(int minutes) => 'دقيقة';
  @override
  String minutes(int minutes) => '$minutes دقائق';
  @override
  String aboutAnHour(int minutes) => 'حوالى ساعة';
  @override
  String hours(int hours) => '$hours ساعات';
  @override
  String aDay(int hours) => 'يوم';
  @override
  String days(int days) => '$days أيام';
  @override
  String aboutAMonth(int days) => 'شهر ';
  @override
  String months(int months) => '$months أشهر';
  @override
  String aboutAYear(int year) => 'سنة';
  @override
  String years(int years) => '$years سنوات';
  @override
  String wordSeparator() => ' ';
}

/// Spanish short Messages
class ArShortMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'الآن';
  @override
  String aboutAMinute(int minutes) => 'دقية';
  @override
  String minutes(int minutes) => '$minutes دقيقة';
  @override
  String aboutAnHour(int minutes) => '~1 hr';
  @override
  String hours(int hours) => '$hours hr';
  @override
  String aDay(int hours) => '~1 d';
  @override
  String days(int days) => '$days d';
  @override
  String aboutAMonth(int days) => '~1 mo';
  @override
  String months(int months) => '$months mo';
  @override
  String aboutAYear(int year) => '~1 yr';
  @override
  String years(int years) => '$years yr';
  @override
  String wordSeparator() => ' ';
}
