import 'package:flutter/material.dart';
import 'package:my_weather_application/models/weather_forecast_daily.dart';
import 'package:my_weather_application/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  const CityView({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var city = snapshot.data?.city.name;
    var country = snapshot.data?.city.country;
    var date = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000);
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '$city, $country',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                color: Colors.white),
          ),
          Text(
            '${Util.getFormattedDate(date)}',
            style: const TextStyle(fontSize: 15.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
