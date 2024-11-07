import 'package:flutter/material.dart';
import 'package:interface_ai/DocumentAssChat.dart';
import 'package:interface_ai/FitnessChat.dart';
import 'package:interface_ai/LawyerChat.dart';
import 'package:interface_ai/TeacherChat.dart';
import 'package:interface_ai/chatpage.dart';
import 'package:interface_ai/history.dart';
import 'package:interface_ai/tessstttt.dart';
import 'package:interface_ai/test.dart';
//import 'package:interface_ai/zzz.dart';

// AssistantCard widget to create individual cards
class AssistantCard extends StatelessWidget {
  final String avatarPath;
  final String name;
  final String description;

  AssistantCard({
    required this.avatarPath,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
                8.0), // Adjust this to control the roundness
            child: Image.asset(
              avatarPath, // Use the provided asset path
              width: 60.0, // Set the width of the avatar
              height: 60.0, // Set the height of the avatar
              fit: BoxFit.cover, // Cover to fill the square properly
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigate to different screens based on the assistant's name
              if (name == 'Document Assistant') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Documentasschat()),
                );
              } else if (name == 'Teacher') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Teacherchat()),
                );
              } else if (name == 'Health and Fitness') {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fitnesschat()),
                );*/
              } else if (name == 'Lawyer') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Lawyerchat()),
                );
              }
            },
            child: Text('Talk', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// EvoCityHome widget that serves as the home screen
class EvoCityHome extends StatelessWidget {
  const EvoCityHome({super.key});

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
        child: SingleChildScrollView(
          // Ensure scrolling for the entire content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              // Updated RichText for EVOCity title
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
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
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EvoCityChatScreen()),
                          );
                        },
                        child: const Text(
                          'Chat',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // Space between buttons

                    // History Button
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => History()),
                          );*/
                        },
                        child: const Text(
                          'History',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Recent Talks
              const Center(
                child: Column(
                  mainAxisSize: MainAxisSize
                      .max, // Aligns the column's size to the content
                  children: [
                    Text(
                      'Empowering your everyday with',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Assistants',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.chat_bubble_outline),
                label: Text('Recent Talks'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.withOpacity(0.2),
                ),
              ),
              SizedBox(height: 20),

              // Assistant Cards
              AssistantCard(
                avatarPath: 'image/avatar1.png', // Updated path
                name: 'Health and Fitness',
                description:
                    'Here to assist you with all your programming questions.',
              ),
              AssistantCard(
                avatarPath: 'image/avatar1.png', // Updated path
                name: 'Teacher',
                description:
                    'I\'m here to assist you in learning various subjects.',
              ),
              AssistantCard(
                avatarPath: 'image/avatar1.png', // Updated path
                name: 'Document Assistant',
                description:
                    'Ready to assist you with all your tech-related inquiries.',
              ),
              AssistantCard(
                avatarPath: 'image/avatar1.png', // Updated path
                name: 'Lawyer',
                description:
                    'Ready to assist you in reaching your fitness goals.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
