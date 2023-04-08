import 'package:flutter/material.dart';

class Destination {
  const Destination(this.icon, this.label);
  final IconData icon;
  final String label;
}

const List<Destination> destinations = <Destination>[
  Destination(Icons.alarm, 'Alarm'),
  Destination(Icons.access_time_sharp, 'World clock'),
  Destination(Icons.timer_outlined, 'Stopwatch'),
  Destination(Icons.av_timer_outlined, 'Timer'),
];