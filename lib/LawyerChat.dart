import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:interface_ai/test.dart';

/*class Lawyerchat extends StatefulWidget {
  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<Lawyerchat> {
  final TextEditingController _controller = TextEditingController();
  List<String> messages = [];

  Future<void> sendMessage(String message) async {
    setState(() {
      messages.add("You: $message");
    });

    
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          'api-key': apiKey,
        },
        body: json.encode({
          'messages': [
            {'role': 'user', 'content': message},
          ],
          'max_tokens': 100,
          'temperature': 0.7,
        }),
      );

      // Logging the status code and response body
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Print full response for debugging purposes
        print(data); // <-- Add this line to see the full response structure

        final reply = data['choices'][0]['message']['content'] ??
            'No response available.';

        setState(() {
          messages.add("AI: $reply");
        });
      } else {
        setState(() {
          messages.add(
              "AI: Error - ${response.statusCode}: ${response.reasonPhrase}");
        });
      }
    } catch (e) {
      setState(() {
        messages.add("AI: Error - ${e.toString()}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chatbot")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(messages[index]));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: "Type a message"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final message = _controller.text;
                    if (message.isNotEmpty) {
                      sendMessage(message);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/

class Lawyerchat extends StatefulWidget {
  const Lawyerchat({super.key});

  @override
  State<Lawyerchat> createState() => _LawyerchatState();
}

class _LawyerchatState extends State<Lawyerchat> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = []; // Holds messages with roles

  /*Future<void> sendMessage(String userMessage) async {
    setState(() {
      // Add user message to messages list
      messages.add({"role": "user", "content": userMessage});
    });

   
    try {
      // Send POST request to AI backend
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          //'api-key': apiKey,
          'Authorization': 'Bearer $apiKey',
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

      // Log status and response for debugging
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final reply = data['choices'][0]['message']['content'] ??
            'No response available.';

        setState(() {
          messages.add({"role": "assistant", "content": reply});
        });
      } else {
        setState(() {
          messages.add(
              {"role": "assistant", "content": "Sorry, something went wrong."});
        });
      }
    } catch (e) {
      setState(() {
        messages
            .add({"role": "assistant", "content": "Error - ${e.toString()}"});
      });
      print("Error: ${e.toString()}"); // Log the error for debugging
    }
  }*/

// Function to handle the API call
  Future<String> fetchAIResponse(String userMessage) async {
    final endpoint =
        'https://ai-azureaistudioevocity129756908007.openai.azure.com/openai/deployments/gpt-35-turbo/chat/completions?api-version=2024-02-15-preview';
    final apiKey = dotenv.env['apiKey']!;

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
      // Background gradient setup
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7A2A80), Color(0xFF090909)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Title and Buttons
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

              // Chat messages display
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ListTile(
                      title: Align(
                        alignment: message["role"] == "user"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: message["role"] == "user"
                                ? Colors.blue
                                : Colors.grey[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message["content"]!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Input field and send button
              Row(
                children: [
                  Icon(Icons.mic, color: Colors.white),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _controller,
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
                      final message = _controller.text;
                      if (message.isNotEmpty) {
                        sendMessage(message);
                        _controller.clear();
                      }
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
