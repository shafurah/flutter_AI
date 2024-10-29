import "package:flutter/material.dart";
import "package:interface_ai/AssistantCard%20.dart";
import "package:interface_ai/test.dart";

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7A2A80), // Start color
              Color(0xFF090909), // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // AppBar with Home and AI Portal buttons
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'EVO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'City',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                /*Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.purple.shade700,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('Home'),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.purple.shade700,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('AI Portal'),
                    ),
                  ],
                ),*/
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 146, 29, 197)
                        .withOpacity(0.2), // Adjust the color as needed
                    borderRadius: BorderRadius.circular(
                        30), // Rounded corners for the container
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 5, vertical: 5), // Inner padding
                  child: Row(
                    mainAxisSize:
                        MainAxisSize.min, // Adjusts width to fit its content
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Home'),
                      ),
                      SizedBox(width: 8), // Space between buttons
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('AI Portal'),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20),

            // Toggle Buttons: Chat and History
            /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple.shade300,
                    ),
                    child: Text('Chat'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey.shade800,
                    ),
                    child: Text('History'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),*/

            // Chat and History buttons row
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Chat Button
                  Expanded(
                    child: Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EvoCityHome()),
                          );
                        },
                        child: const Text(
                          'Chat',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Space between buttons
                  // History Button
                  Expanded(
                    child: Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => History()),
                          );
                        },
                        child: const Text(
                          'History',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Centering the content inside the main body
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Centers horizontally
                  children: [
                    // Conversation header
                    Text(
                      'Conversation with Evo',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Today section
            buildSectionHeader('Today'),
            buildItem('Enhance Your Python Skills Today'),

            // Yesterday section
            buildSectionHeader('Yesterday'),
            buildItem('Heart-Healthy Breakfast Ideas'),

            // Previous 30 Days section
            buildSectionHeader('Previous 30 Days'),
            buildItem('Top Travel Spot 2023'),
            buildItem('Top Motivational Books to Inspire'),
            buildItem('Friendly Greetings'),

            // Spacer to push content upwards
            Spacer(),
          ],
        ),
      ),
    );
  }

  // Helper method to build section headers
  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white60,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Helper method to build items under each section
  Widget buildItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
