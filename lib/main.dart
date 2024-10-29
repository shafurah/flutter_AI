import 'package:flutter/material.dart';
import 'package:interface_ai/AssistantCard%20.dart';

void main() {
  runApp(EvoCityApp());
}

class EvoCityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EVOCity',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: EvoCityHome(),
      debugShowCheckedModeBanner: false, // This removes the debug banner
    );
  }
}
