import 'package:flutter/material.dart';

import 'package:telegrapi/telegrapi.dart';
import 'package:telegrapi_example/environment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _telegrapiPlugin = Telegrapi.initialize(
    token: Environment.telebotToken,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: OutlinedButton(
            onPressed: () async {
              try {
                await _telegrapiPlugin.sendMessage(
                  chatId: '151444508',
                  message: 'Testing',
                );
              } catch (e) {
                debugPrint(e.toString());
              }
            },
            child: const Text('Testing'),
          ),
        ),
      ),
    );
  }
}
