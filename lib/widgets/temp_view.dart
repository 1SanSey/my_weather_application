import 'package:flutter/material.dart';
import 'package:my_weather_application/models/weather_forecast_daily.dart';
import 'package:my_weather_application/utilities/forecast_util.dart';

class TempView extends StatelessWidget {
  const TempView({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;
  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList[0].temp.day.toStringAsFixed(0);
    var description = forecastList[0].weather[0].description.toUpperCase();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            icon,
            scale: 0.4,
            color: Colors.white,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            children: <Widget>[
              Text(
                '$temp ℃',
                style: const TextStyle(fontSize: 54.0, color: Colors.white),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 14.0, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
