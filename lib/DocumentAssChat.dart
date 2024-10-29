import 'package:flutter/material.dart';
//import 'package:interface_ai/AssistantCard%20.dart';
import 'package:interface_ai/history.dart';
import 'package:interface_ai/test.dart';

class Documentasschat extends StatelessWidget {
  const Documentasschat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    History()), // Replace NewPage with your desired page
          );
        },
        backgroundColor: Colors.purple.shade700,
        child: Icon(Icons.add,
            color: Colors.white), // Customize the icon as needed
      ),*/

      // Remove the AppBar and use a gradient directly in the body
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title and Buttons
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
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
                        mainAxisSize: MainAxisSize
                            .min, // Adjusts width to fit its content
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()),
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
                                MaterialPageRoute(
                                    builder: (context) => MyApp()),
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
              ),

              // Chat and History buttons row
              /*Container(
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
                              MaterialPageRoute(
                                  builder: (context) => History()),
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

              // Recent Talks
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.chat_bubble_outline),
                label: Text('Recent Talks'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.withOpacity(0.2),
                ),
              ),*/

              Row(
                children: [
                  // Inline History button (align to the left)
                  TextButton.icon(
                    onPressed: () {
                      // Navigate to the history page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => History()),
                      );
                    },
                    icon: Icon(Icons.history, color: Colors.white70),
                    label: Text('History',
                        style: TextStyle(color: Colors.white70)),
                  ),

                  // Recent Chats button
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle recent chats functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: Icon(Icons.chat_bubble_outline, color: Colors.white),
                    label: Text('Recent Chats',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 10), // Space between buttons
                ],
              ),
              SizedBox(height: 20),

              // Chat bubble for "Evo"
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFF6E3687), // Chat bubble color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar Image
                    CircleAvatar(
                      radius:
                          15, // Set the radius to adjust the size of the avatar
                      backgroundImage: AssetImage(
                          'image/images.png'), // Load your uploaded image
                    ),
                    const SizedBox(width: 12), // Space between avatar and text

                    // Text Column (Name and Message)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Evo:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Hello! I\'m your Evo Document Assistant, here to simplify complex topics and assist with homework. Just ask me any question, and let\'s enjoy learning together.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Sample prompts
              Text(
                'Sample prompts:',
                style: TextStyle(color: Colors.white60, fontSize: 12),
              ),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xFF6E3687),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'What are your beginner tips for learning a new language?',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const Spacer(),

              // Input field
              Row(
                children: [
                  Icon(Icons.mic,
                      color: Colors.white), // Adjust icon color and size
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Ask AI anything on any topic',
                        hintStyle: TextStyle(color: Colors.white60),
                        filled: true,
                        fillColor: Color(0xFF6E3687),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      // Handle send action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}