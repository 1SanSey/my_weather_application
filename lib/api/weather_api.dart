import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:my_weather_application/models/weather_forecast_daily.dart';
import 'package:my_weather_application/utilities/constants.dart';
import 'package:my_weather_application/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Map<String, String?> parameters;

    if (isCity == true) {
      var queryParameters = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
      };
      parameters = queryParameters;
    } else {
      Location location = Location();
      await location.getCurrentLocation();
      var queryParameters = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = queryParameters;
    }

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);

    //log('request:$uri');

    var request = await http.get(uri);
    var response = request.body;

    //print('response: $response');

    if (request.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response));
    } else {
      return Future.error('Error response!');
    }
  }
}
