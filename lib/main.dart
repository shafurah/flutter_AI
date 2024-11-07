import 'package:flutter/material.dart';
import 'package:interface_ai/AssistantCard%20.dart'; // Adjusted for correct file name syntax
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  //await dotenv.load(fileName: ".env"); // Load environment variables
  try {
    await dotenv.load(fileName: ".env");
    print("API Key: ${dotenv.env['apiKey']}");
  } catch (e) {
    print("Could not load .env file: $e");
  }
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
