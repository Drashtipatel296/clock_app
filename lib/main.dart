
import 'package:clock_app/utils/navbar.dart';
import 'package:clock_app/view/screens/analog.dart';
import 'package:clock_app/view/screens/digital.dart';
import 'package:clock_app/view/screens/stopwatch.dart';
import 'package:clock_app/view/screens/timer.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NavBar(),
  ));
}


