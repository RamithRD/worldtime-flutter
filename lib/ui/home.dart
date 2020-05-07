import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map timeData = {};

  @override
  Widget build(BuildContext context) {

    //gets the API data from splash screen inside build method
    timeData = timeData.isNotEmpty ? timeData : ModalRoute.of(context).settings.arguments;
    print(timeData);

    //set background
    String bgImage = timeData['isDayTime'] ? 'day.png' : 'night.png';
    Color statusBg = timeData['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: statusBg,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {

                        dynamic result = await Navigator.pushNamed(context, '/location');

                        setState(() {

                          timeData = {

                            'location' : result['location'],
                            'flag' : result['flag'],
                            'time' : result['time'],
                            'isDayTime' : result['isDayTime'],

                          };

                        });

                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[300]
                        ),

                      )
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        timeData['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    timeData['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
