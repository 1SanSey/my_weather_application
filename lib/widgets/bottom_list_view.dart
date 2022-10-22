import 'package:flutter/material.dart';
import '../models/weather_forecast_daily.dart';
import 'forecast_card.dart';

class BottomListView extends StatelessWidget {
  const BottomListView({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text('7-Day Weather Forecast'.toUpperCase(),
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        Container(
          height: 140.0,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: snapshot.data!.list!.length,
              itemBuilder: (context, index) => Container(
                    width: MediaQuery.of(context).size.width / 2.7,
                    height: 160,
                    color: Colors.white,
                    child: forecastCard(snapshot, index),
                  )),
        ),
      ],
    );
  }
}
