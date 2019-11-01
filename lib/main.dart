import 'package:flutter/material.dart';
import 'package:app1/pages/home.dart';
import 'package:app1/pages/choose_location.dart';
import 'package:app1/pages/loading.dart';

void main() => runApp(
      MaterialApp(
        routes: {
          '/': (context) => Loading(),
          '/home': (context) => Home(),
          '/locations': (context) => ChooseLocation()
        },
        initialRoute: '/',
      ),
    );
