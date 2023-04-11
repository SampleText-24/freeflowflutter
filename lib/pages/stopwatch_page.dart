import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  // Приколы для работы таймера
  int milliseconds = 0, seconds = 0, minutes = 0, hours = 0;
  String digitMilliseconds = '00',
      digitSeconds = '00',
      digitMinutes = '00',
      digitHours = '00';
  Timer? timer;
  bool started = false;
  List laps = [];
  List gaps = []; // добавить разницу между кругами

  // Логика работы кнопок
  void start() {
    started = true;
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      int localMilliseconds = milliseconds + 1;
      int localSeconds = seconds;
      int localMinutes = minutes;

      if (localMilliseconds > 99) {
        localMilliseconds = 0;
        localSeconds++;
      }

      if (localSeconds > 59) {
        localSeconds = 0;
        localMinutes++;
      }

      setState(() {
        milliseconds = localMilliseconds;
        seconds = localSeconds;
        minutes = localMinutes;
        digitMilliseconds =
            (milliseconds >= 10) ? '$milliseconds' : '0$milliseconds';
        digitSeconds = (seconds >= 10) ? '$seconds' : '0$seconds';
        digitMinutes = (minutes >= 10) ? '$minutes' : '0$minutes';
      });
    });
  }

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      started = false;
      milliseconds = 0;
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitMilliseconds = '00';
      digitSeconds = '00';
      digitMinutes = '00';
      digitHours = '00';
      laps = [];
    });
  }

  void addLaps() {
    String lap = '$digitMinutes:$digitSeconds:$digitMilliseconds';
    setState(() {
      laps.add(lap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
        scrolledUnderElevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$digitMinutes:$digitSeconds:$digitMilliseconds',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 400,
              child: ListView.builder(
                  itemCount: laps.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Lap №${index + 1}'),
                          Text('${laps[index]}')
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: started || milliseconds == 0
                        ? Colors.grey.shade800
                        : Colors.black45,
                    child: IconButton(
                      onPressed: started || milliseconds == 0
                          ? null
                          : () {
                              reset();
                            },
                      icon: Icon(Icons.replay),
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.lightBlueAccent,
                    child: IconButton(
                      onPressed: () {
                        started ? stop() : start();
                      },
                      icon:
                          started ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        !started ? Colors.grey.shade800 : Colors.black45,
                    child: IconButton(
                      onPressed: !started
                          ? null
                          : () {
                              addLaps();
                            },
                      icon: Icon(Icons.timer_outlined),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
