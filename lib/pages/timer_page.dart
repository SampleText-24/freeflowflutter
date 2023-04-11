import 'package:SampleTimer/widgets/wheel_picker.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  bool shadowColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
        scrolledUnderElevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WheelPicker(limit: 100, title: 'h'),
              SizedBox(
                height: 48,
                child: Text(':'),
              ),
              WheelPicker(limit: 60, title: 'min'),
              SizedBox(
                height: 48,
                child: Text(':'),
              ),
              WheelPicker(limit: 60, title: 'sec')
            ],
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.lightBlueAccent,
            child: IconButton(
              onPressed: () {},
              icon: false ? Icon(Icons.pause) : Icon(Icons.play_arrow),
            ),
          ),
        ],
      ),
    );
  }
}
