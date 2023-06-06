import 'package:intl/intl.dart';

import 'global.dart';

calculate_time_zone(dat) {
  print(
    "ssssss $dat",
  );
  if (dat == "null" || dat == null) {
    print("this is if");
    return null;
  }
  final date = DateFormat("dd/MM/yyyy").parse(dat.toString());
  if ((date.compareTo(DateTime.now())) == -1) {
    print("this is ifeeeeee");
    final d1 = date.subtract(date.timeZoneOffset);
    final d2 = d1.add(Duration(hours: DateTime.now().hour + time_zone, minutes: DateTime.now().minute));
    return d2.millisecondsSinceEpoch;
  } else {
    final d1 = date.add(Duration(hours: time_zone));
    return d1.millisecondsSinceEpoch;
  }
}

calculate_time_zone_timestamp(dat) {
  if (dat == "null" || dat == null) {
    print("this is if");
    return null;
  }
  final date = DateTime.fromMillisecondsSinceEpoch(dat);
  print("ddd, ${date}");
  if ((date.compareTo(DateTime.now())) == -1) {
    print("this is if dooi ${date.millisecondsSinceEpoch}");
    final d1 = date.subtract(date.timeZoneOffset);
    print("d1 ${d1.millisecondsSinceEpoch}");
    final d2 = d1.add(Duration(hours: DateTime.now().hour + time_zone, minutes: DateTime.now().minute));

    // final d2 = d1.add(Duration(hours: time_zone));
    print("d2 ${d2.millisecondsSinceEpoch}");
    return d2.millisecondsSinceEpoch;
  } else {
    final d1 = date.add(Duration(hours: time_zone));
    return d1.millisecondsSinceEpoch;
  }
}

calculate_time_zone_with_time(dat) {
  if (dat == "null" || dat == null) {
    print("this is if");
    return null;
  }
  final date = DateFormat("dd/MM/yyyy").parse(dat.toString());
  if ((date.compareTo(DateTime.now())) == -1) {
    final d1 = date.subtract(date.timeZoneOffset);
    final d2 = d1.add(Duration(hours: DateTime.now().hour + time_zone, minutes: DateTime.now().minute));
    return d2.millisecondsSinceEpoch;
  } else {
    final d1 = date.add(Duration(hours: time_zone));
    return d1.millisecondsSinceEpoch;
  }
}

calculate_date_time_from_timestamp(dat) {
  var d1 = (DateTime.fromMillisecondsSinceEpoch(dat).toUtc()).add(Duration(hours: time_zone));
  var d2 = DateFormat("dd/MM/yyyy").format(d1);
  return d2;
}
