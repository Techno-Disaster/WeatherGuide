import 'package:flutter/material.dart';

import '../services/weather.dart';
import '../utilities/constants.dart';
import 'city_screen.dart';


class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  @override
  void initState() {
    super.initState();
    updateUI(widget
        .locationweather); //get this data from weatherData to LoationScreen then this is passed to LOcationScreenState via the
    //widget property and the we pass this as an argument to updateUI.
  }

  double temp;
  String temperature;
  String weatherIcon;
  String weatherstats;
  String cityname;
  void updateUI(dynamic weatherData) {
    setState(() {
      temp = weatherData['main']['temp'].toDouble();
      weatherstats = weather.getMessage(temp);
      temperature = temp.toStringAsFixed(1);
      var condition = weatherData['weather'][0]['id'];
      cityname = weatherData['name'];
      weatherIcon = weather.getWeatherIcon(condition);
      print(temp);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.only(top: 15),
                    onPressed: () async {
                      var weatherData = await widget.locationweather;
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.location_on,
                      size: 40.0,
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.only(top: 15),
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      {
                        var weatherData1 =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherData1);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                    Text(
                      '$temperature°C',
                      style: kTempTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    '$weatherstats in $cityname',
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
