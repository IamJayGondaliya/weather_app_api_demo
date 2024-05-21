import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weather.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();

  String api = "https://weatherbit-v1-mashape.p.rapidapi.com/forecast/3hourly";
  Map<String, String> headers = {
    'X-RapidAPI-Key': '2e59e3a545mshd803fd1ed71a23cp1eb9c0jsne0d6a0bc95b6',
    'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com'
  };
  Future<Weather> getAllData(
      {double lat = 21.1702, double lon = 72.8311}) async {
    Weather weather = Weather.dummy();

    http.Response response =
        await http.get(Uri.parse("$api?lat=$lat&lon=$lon"), headers: headers);

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      weather = Weather.fromJson(data as Map<String, dynamic>);
    }

    return weather;
  }
}
