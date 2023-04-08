import 'package:flutter/material.dart';

class WorldClockPage extends StatefulWidget {
  const WorldClockPage({Key? key}) : super(key: key);

  @override
  State<WorldClockPage> createState() => _WorldClockPageState();
}

class _WorldClockPageState extends State<WorldClockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('World clock')),
      body: Text('BODY'),
    );
  }
}
