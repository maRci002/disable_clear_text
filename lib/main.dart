import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Disable Clear Text',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final client = HttpClient();
  var _httpResult = 'Press "Fetch button"';

  void _fetchClearText() async {
    try {
      final url = Uri.parse('http://example.com');
      final request = await client.getUrl(url);
      final response = await request.close();
      final responseData = await response.transform(utf8.decoder).join();

      _httpResult = 'type: ${response.runtimeType}\ncontentLength: ${response.contentLength}\ncontainsHtmlTag: ${responseData.contains('<html>')}';
    } catch (e) {
      _httpResult = e.toString();
    }

    setState(() {});
  }

  @override
  void dispose() {
    client.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_httpResult),
              ElevatedButton(
                onPressed: _fetchClearText,
                child: const Text('Fetch'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
