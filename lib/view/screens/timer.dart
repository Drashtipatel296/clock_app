import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

int seconds=0,minutes=0;
bool isRunning=false;

class _TimerScreenState extends State<TimerScreen> {

  Future<void> stop() async {
    await Future.delayed(const Duration(seconds: 1),
            (){
          setState(() {
            if(minutes>0) {
              if (seconds == 0) {
                minutes--;
                seconds = 59;
              }
              else {
                seconds--;
              }
            }
          });
        }
    );
    if(isRunning)
      stop();
  }

  @override
  Widget build(BuildContext context) {

    String digitalseconds = seconds.toString().padLeft(2, '0');
    String digitalminutes = minutes.toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Timer',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.add,
            color: Colors.white,
            size: 33,
          ),
          SizedBox(width: 15),
          Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 320,
              width: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xff2B1E57), width: 7),
              ),
              alignment: Alignment.center,
              child: Text(
                '$digitalminutes : $digitalseconds',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    seconds = 0;
                     minutes = 2;
                    setState(() {

                    });
                  }, child: Text('2 Minutes',style: TextStyle(fontSize: 18),),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      seconds = 0;
                      minutes = 5;
                      setState(() {

                      });
                    }, child: Text('5 Minutes',style: TextStyle(fontSize: 18),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      seconds = 0;
                      minutes = 10;
                      setState(() {

                      });
                    }, child: Text('10 Minutes',style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if(isRunning){
                    isRunning = false;
                  } else {
                    isRunning = true;
                    stop();
                  };
                },
                child: Container(
                  height: 70,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.indigoAccent,
                  ),
                  child: (isRunning)?Center(child: Icon(Icons.pause,color: Colors.white,size: 30,)):Icon(Icons.arrow_right_sharp,color: Colors.white,size: 70,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
