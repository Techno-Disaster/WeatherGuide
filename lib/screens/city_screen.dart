import 'package:flutter/material.dart';
//import '../utilities/constants.dart';
import 'location_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LocationScreen();
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  autocorrect: true,
                  enableSuggestions: true,
                  style: TextStyle(fontSize: 25),
                  onChanged: (value) {
                    cityName = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 30,
                    ),
                    filled: true,
                    //hintText: "Enter City Here",
                    contentPadding: EdgeInsets.only(
                        left: 80, top: 40, right: 10, bottom: 10),
                    labelText: "Enter City Here",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              // Stack(
              //   children: <Widget>[
              //     Opacity(
              //       opacity: 0.7,
              //       child: ButtonTheme(
              //         minWidth: 160.0,
              //         height: 60.0,
              //         child: FlatButton(
              //           onPressed: () {
              //             Navigator.pop(context, cityName);
              //           },
              //           color: Colors.amberAccent,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //           child: null,
              //         ),
              //       ),
              //     ),
              //     Text(
              //       "Get Weather",
              //       style: TextStyle(fontSize: 20, color: Colors.black),
              //     ),
              //   ],
              //   alignment: AlignmentDirectional.center,
              // ),
              Container(
                child: ButtonTheme(
                  minWidth: 160.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: Colors.white.withOpacity(0.7),
                    child: Text(
                      "Get Weather",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onPressed: () {
                       Navigator.pop(context, cityName);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
