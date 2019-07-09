import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  Widget _titleSection() => Container(
    padding: EdgeInsets.all(32),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Oeschinen Lake Campground",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              Text(
                "Kandersteg, Switzerland",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15
                ),
              )
            ],
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.red,
        ),
        Text("41")
      ],
    ),
  );

  Widget _getButton(IconData iconData, String title, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          color: color,
        ),
        Container(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            title,
            style: TextStyle(
              color: color
            ),
          ),
        )
      ],
    );
  }

  Widget _getButtons(Color primaryColor) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      _getButton(Icons.call, "Call", primaryColor),
      _getButton(Icons.near_me, "Route", primaryColor),
      _getButton(Icons.share, "Share", primaryColor)
    ],
  );

  Widget _textSection() => Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
      style: TextStyle(
        fontSize: 20
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter layout demo",
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Image.asset(
              "images/lake.jpg",
              width: double.infinity,
              height: 340,
              fit: BoxFit.cover,
            ),
            _titleSection(),
            _getButtons(Theme.of(context).primaryColor),
            _textSection()
          ]
        ),
      )
    );
  }
}

