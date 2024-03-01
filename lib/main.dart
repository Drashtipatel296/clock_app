import 'package:clock_app/analogclock.dart';
import 'package:clock_app/digitalclock.dart';
import 'package:clock_app/stopwatch.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: digitalclock(),
  ));
}


