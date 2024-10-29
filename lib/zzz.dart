import 'package:flutter/material.dart';
import 'package:interface_ai/test.dart';

class 55 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<55> {
  // Track the selected button
  String _selectedButton = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 146, 29, 197).withOpacity(0.2),
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          padding:
              EdgeInsets.symmetric(horizontal: 5, vertical: 5), // Inner padding
          child: Row(
            mainAxisSize: MainAxisSize.min, // Adjusts width to fit content
            children: [
              // Home Button
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedButton = 'Home';
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: _selectedButton == 'Home'
                      ? Colors.purple.shade300 // Highlight color when selected
                      : Colors.transparent, // Transparent when not selected
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Home'),
              ),
              SizedBox(width: 8), // Space between buttons

              // AI Portal Button
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedButton = 'AI Portal';
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: _selectedButton == 'AI Portal'
                      ? Colors.purple.shade300 // Highlight color when selected
                      : Colors.transparent, // Transparent when not selected
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('AI Portal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
