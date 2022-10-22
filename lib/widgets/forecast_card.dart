import 'package:flutter/material.dart';
import '../utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0];
  var temp = forecastList[index].temp.day.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dayOfWeek,
              style: const TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 0, 140, 255))),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$temp ℃',
                      style: const TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 0, 140, 255)),
                    ),
                  ),
                  Image.network(
                    icon,
                    scale: 1.2,
                    color: const Color.fromARGB(255, 0, 140, 255),
                  )
                ],
              )
            ],
          )
        ],
      )
    ],
  );
}
