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

    List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text(
            'Analog Clock',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),
          ),
          actions: [
            Icon(Icons.more_vert,color: Colors.white,size: 30,),
          ],
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black87,
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
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12,
                        color: Colors.lightBlue,
                        spreadRadius: 0.5,
                        offset: Offset(3, 0),
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
              const SizedBox(height: 50),
              Text(
                '${dateTime.hour % 12} : ${dateTime.minute} : ${dateTime.second}',
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text('India Time',style: TextStyle(color: Colors.white,fontSize: 20),),
              Text('${daysOfWeek[dateTime.weekday - 1]}, ${dateTime.day} ${_getMonth(dateTime.month)}',style: TextStyle(color: Colors.white,fontSize: 28),),
            ],
          ),
        ),
      ),
    );
  }
}

String _getMonth(int month) {
  switch (month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return '';
  }
}
