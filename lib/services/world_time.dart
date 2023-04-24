import 'dart:io';

import 'package:http/http.dart';
import "dart:convert";
import "package:intl/intl.dart";

class WorldTime {
  late String location, time, flag, url;
  bool isDaytime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  var client = HttpClient();

  Future<void> getTime() async {
    Response res;
    try {
      res = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(res.body);
      String dateTime = data["datetime"],
          offset = data['utc_offset'].substring(1, 3);

      DateTime now =
          DateTime.parse(dateTime).add(Duration(hours: int.parse(offset)));

      isDaytime = (now.hour > 6 && now.hour < 18);
      print(isDaytime);
      time = DateFormat.jm().format(now);
    } catch (err) {
      print('Error : $err');
      isDaytime = false;
      time = "*_*";
    }
  }
}
