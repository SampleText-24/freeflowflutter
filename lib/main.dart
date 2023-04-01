import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ny zdarova!',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello world!')
        ),
        body: const Center(
          child: Text('Привет мир', style: TextStyle(color: Colors.pinkAccent)),
        ),
      ),
    );
  }
}
