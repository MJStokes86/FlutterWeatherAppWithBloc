import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/WeatherModel.dart';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.Client().get(
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=6d423e228a6758dc11527ada6ad2c1d5");

    if (result.statusCode != 200) throw Exception();
    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather);
  }
}
