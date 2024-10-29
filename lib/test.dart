import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0), // Set the height of the AppBar
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple[900]!, // Start color
                  Colors.purple[600]!, // End color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: AppBar(
              // Make sure to set backgroundColor to transparent
              backgroundColor: Colors.transparent,
              title: const Text(
                'EVOCity',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24, // Set the font size to 24
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Text('Welcome to EVOCity!'), // Example body content
        ),
      ),
    );
  }
}
