import 'dart:async';

import 'package:flutter/material.dart';

class digitalclock extends StatefulWidget {
  const digitalclock({super.key});

  @override
  State<digitalclock> createState() => _ClockAppState();
}

DateTime dateTime = DateTime.now();

class _ClockAppState extends State<digitalclock> {
  @override
  Widget build(BuildContext context) {

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text(
            'Clock App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/bg3.gif',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 150),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white,fontSize: 68,fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '${dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12}:${dateTime.minute}:${dateTime.second}',
                    ),
                    TextSpan(
                      text: ' ${dateTime.hour < 12 ? 'AM' : 'PM'}',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
