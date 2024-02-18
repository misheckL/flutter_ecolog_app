import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void StartTime() {
    const oneSec = Duration(seconds: 3);
    Timer.periodic(oneSec, (Timer timer) {
      print("Timed: ");
      Navigator.of(context).pushNamed("/welcome");
      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext))) {
      //return const WelcomeScreen();
      //};
      timer.cancel();
    });
  }

  @override
  void initState() {
    StartTime();
    // TODO: Implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          ClipOval(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.leave_bags_at_home_outlined,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),
          Text(
            "Ecolog",
            style: TextStyle(
              fontSize: 24,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
