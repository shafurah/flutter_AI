import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:interface_ai/history.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:interface_ai/test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Documentasschat extends StatefulWidget {
  const Documentasschat({super.key});

  @override
  State<Documentasschat> createState() => _DocumentasschatState();
}

class _DocumentasschatState extends State<Documentasschat> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];

// Function to handle the API call
  Future<String> fetchAIResponse(String userMessage) async {
    final endpoint =
        'https://ai-azureaistudioevocity129756908007.openai.azure.com/openai/deployments/evohealth/chat/completions?api-version=2024-08-01-preview';
    final apiKey = dotenv.env['apiKey']!;

    // Check for internet connection
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("No internet connection");
      return 'No internet connection. Please check your connection and try again.';
    }

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          //'Authorization': 'Bearer $apiKey',
          'api-key': apiKey,
        },
        body: json.encode({
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are an AI assistant that helps with document tasks like writing and reformatting letters, emails, and other documents.'
            },
            {'role': 'user', 'content': userMessage},
          ],
          'max_tokens': 100,
          'temperature': 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['choices'][0]['message']['content'] ??
            'No response available.';
      } else {
        return 'Sorry, something went wrong. Status code: ${response.statusCode}';
      }
    } on SocketException {
      print('No Internet connection');
      return 'No internet connection. Please check your connection and try again.';
    } catch (e) {
      return 'Error - ${e.toString()}';
    }
  }

  Future<void> sendMessage(String userMessage) async {
    setState(() {
      // Add user message to messages list
      messages.add({"role": "user", "content": userMessage});
    });

    // Fetch AI response using fetchAIResponse
    final aiResponse = await fetchAIResponse(userMessage);

    setState(() {
      // Add AI response to messages list
      messages.add({"role": "assistant", "content": aiResponse});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF2B0032),
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support_agent),
              label: 'Support',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF2B0032),
          automaticallyImplyLeading: false, // Removes the back button
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side: App title with lightning icon
              Row(
                children: [
                  const Icon(Icons.flash_on,
                      color: Colors.white, size: 20), // Lightning icon
                  const SizedBox(width: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'EVO',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: 'City',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Right side: Home and AI Feature buttons
              Row(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                    ),
                    child: const Text('Home'),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      // Navigate to AI Feature
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                    ),
                    child: const Text('AI Feature'),
                  ),
                ],
              ),
            ],
          ),
        ),

        //),

        body: Column(
          children: [
            // Row for Recent Chats and History buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Recent Chats Button
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
                    icon: const Icon(Icons.chat_bubble_outline,
                        color: Colors.white),
                    label: const Text('Recent Chats',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 10),

                  // History Button
                  TextButton.icon(
                    onPressed: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => History()),
                      );*/
                    },
                    icon: const Icon(Icons.history, color: Colors.white70),
                    label: const Text(
                      'History',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Additional content below if needed
            //],
//),

            //const Spacer(),

            // Chat messages display
            // Chat messages display
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isUser = message["role"] == "user";

                  return ListTile(
                    leading: isUser
                        ? null
                        : CircleAvatar(
                            backgroundColor: Colors.grey[600],
                            child: Text('E',
                                style: TextStyle(color: Colors.white)),
                            radius:
                                15, // Set the radius to adjust the size of the avatar
                            backgroundImage: AssetImage('image/images.png'),
                          ),
                    trailing: isUser
                        ? CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text('U',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 227, 173, 236))),
                            radius:
                                15, // Set the radius to adjust the size of the avatar
                            backgroundImage: AssetImage('image/images.png'),
                          )
                        : null,
                    title: Align(
                      alignment:
                          isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: isUser
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          if (!isUser)
                            Text(
                              'Evo',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: isUser ? Colors.blue : Colors.grey[800],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              message["content"]!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Input field
            /*Row(
              children: [
                const Icon(Icons.mic, color: Colors.black),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Ask AI anything on any topic',
                      hintStyle: const TextStyle(color: Colors.white60),
                      filled: true,
                      fillColor: const Color(0xFF6E3687),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.image, color: Colors.black),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.black),
                  onPressed: () {
                    final message = _controller.text;
                    if (message.isNotEmpty) {
                      sendMessage(message);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),*/
            Container(
              decoration: BoxDecoration(
                color: const Color(
                    0xFFE0BBE4), // Light purple background for the entire input section container
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(
                      0xFFBDBDBD), // Grey background for the icons and text field
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    // Microphone Icon
                    const Icon(Icons.mic, color: Colors.white),
                    const SizedBox(width: 10),

                    // Text Field
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Ask AI anything on any topic',
                          hintStyle: const TextStyle(color: Colors.white60),
                          border: InputBorder.none, // Remove default border
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Image Icon
                    IconButton(
                      icon: const Icon(Icons.image, color: Colors.white),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 3),

                    // Send Icon
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        final message = _controller.text;
                        try {
                          if (message.isNotEmpty) {
                            sendMessage(message);
                            _controller.clear();
                          }
                        } catch (err) {
                          print(err);
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
