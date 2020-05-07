import 'package:flutter/material.dart';
import 'package:worldtime/ui/home.dart';
import 'package:worldtime/ui/select_location.dart';
import 'package:worldtime/ui/splash.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Splash(),
    '/home': (context) => Home(),
    '/location' : (context) => SelectLocation()
  },
));

