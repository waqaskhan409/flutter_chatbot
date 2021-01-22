import 'package:flutter/material.dart';
import 'package:flutter_bot_chat/ui/chat.dart';
import 'package:flutter_bot_chat/ui/chat_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bot chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ChatViewmodel(),
        lazy: false,
        child: IndividualChat(),
      ),
    );
  }
}