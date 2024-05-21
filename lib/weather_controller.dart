import 'package:flutter/material.dart';
import 'package:weather_app/weather.dart';

import 'api_helper.dart';

class WeatherController extends ChangeNotifier {
  Weather weather = Weather.dummy();
  bool isLoading = true;

  WeatherController() {
    loadData();
  }

  loadData({double lat = 21.1702, double lon = 72.8311}) async {
    isLoading = true;
    notifyListeners();
    weather = await ApiHelper.apiHelper.getAllData(
      lat: lat,
      lon: lon,
    );
    isLoading = false;
    notifyListeners();
  }
}
