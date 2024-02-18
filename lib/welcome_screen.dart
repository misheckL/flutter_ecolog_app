import 'dart:async';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key,});
  
  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
      
  //     _counter++;
  //   });
  // }

void startTimer() {
  const oneSec = Duration(seconds: 3);
  Timer.periodic(oneSec, (Timer timer) {
    print("Timed: ");
    timer.cancel();
   });
}


@override
  void initState() {
    startTimer();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
   
    return Container(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            ClipOval(child: Container(child: Icon(Icons.pentagon, size: 64, color: Colors.green,),
            ),),
            Expanded(child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  
                  bottomLeft: Radius.circular(
                    MediaQuery.of(context).size.width/2
                  ),
                  bottomRight: Radius.circular(
                    MediaQuery.of(context).size.width/2
                  ))),
              child: Icon(Icons.person),)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Help the environment", style: TextStyle(decoration: TextDecoration.none, color: Colors.black),textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore", style: TextStyle(decoration: TextDecoration.none, color: Colors.grey, fontSize: 14),textAlign: TextAlign.center,),
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed("/login");
            }, child: Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Icon(Icons.arrow_forward),))
            ],
          ),
        ),
      ),
    );
  }
}