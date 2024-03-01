import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class analogclock extends StatefulWidget {
  const analogclock({super.key});

  @override
  State<analogclock> createState() => _ClockAppState();
}

DateTime dateTime = DateTime.now();

class _ClockAppState extends State<analogclock> {
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
          backgroundColor: Colors.white,
          title: const Text(
            'Analog Clock',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg5.jpeg'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 310,
                  width: 310,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/clock2.png'),
                    ),
                    shape: BoxShape.circle,
                    //border: Border.all(width: 3),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12,
                        color: Colors.white,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      const Center(
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      Center(
                        child: Transform.rotate(
                          angle: dateTime.second * 6 * pi / 180,
                          child: const VerticalDivider(
                            color: Colors.red,
                            indent: 32,
                            endIndent: 110,
                            thickness: 3,
                          ),
                        ),
                      ),
                      Center(
                        child: Transform.rotate(
                          angle: dateTime.minute * 6 * pi / 180,
                          child: const VerticalDivider(
                            color: Colors.black,
                            indent: 55,
                            endIndent: 110,
                            thickness: 5,
                          ),
                        ),
                      ),
                      Center(
                        child: Transform.rotate(
                          angle: (dateTime.hour % 12 + dateTime.minute / 60) *
                              30 *
                              pi /
                              180,
                          child: const VerticalDivider(
                            color: Colors.black,
                            indent: 85,
                            endIndent: 130,
                            thickness: 6.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Text(
                '${dateTime.hour % 12} : ${dateTime.minute} : ${dateTime.second}',
                style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
