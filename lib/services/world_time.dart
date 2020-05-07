import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name for the UI
  String time; //time in that location
  String flag; //image url for local asset
  String url; //location url for api endpoint
  bool isDayTime; //true if day time

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try{

      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map timeMap = jsonDecode(response.body);
      //print(timeMap);

      //get properties from data
      String datetime = timeMap['datetime'];
      String offset = timeMap['utc_offset'].substring(1,3);

      //create datetime object
      DateTime currentTime = DateTime.parse(datetime);
      currentTime = currentTime.add(Duration(hours: int.parse(offset)));

      //time is between 6am and 8pm
      isDayTime = (currentTime.hour > 6 && currentTime.hour < 20) ? true : false;

      //set the time property
      time = DateFormat.jm().format(currentTime);

    } catch (e) {
      print('exception $e');
    }



  }


}

