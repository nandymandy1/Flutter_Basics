import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  // Location name for the UI
  String location;
  // The time in that location
  String time;
  // Flag of that location
  String flag;
  // Day or Night
  bool isDayTime;

  // Base URL
  String baseURI = "http://worldtimeapi.org/api/timezone";
  // End Point of the URL
  String url;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response res = await get('$baseURI/$url');
      Map data = jsonDecode(res.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (err) {
      print(err);
      time = 'Could not get time.';
    }
  }
}
