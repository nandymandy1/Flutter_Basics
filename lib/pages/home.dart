import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDayTime'] ? 'day.webp' : 'night.webp';

    Color bgColor =
        data['isDayTime'] ? Colors.blueAccent[200] : Colors.indigo[900];

    Color textColor = data['isDayTime'] ? Colors.grey[800] : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/$bgImage',
                ),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic res = await Navigator.pushNamed(
                      context,
                      '/locations',
                    );
                    setState(() {
                      data = {
                        "time": res['time'],
                        "flag": res['flag'],
                        "location": res['location'],
                        "isDayTime": res['isDayTime']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: textColor,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 50.0,
                    letterSpacing: 2.0,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
