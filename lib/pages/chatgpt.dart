import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(ChatGPT());
}

class ChatGPT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scrollable Text like ChatGPT'),
        ),
        body: ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _scrollController = ScrollController();
  String _displayText = '';
  final String _text = 'What can I help with?';

  @override
  void initState() {
    super.initState();
    _startScrollingText();
  }

  void _startScrollingText() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_displayText.length < _text.length) {
        setState(() {
          _displayText += _text[_displayText.length];
        });
      } else {
        timer.cancel(); // Stop the timer once the text is fully displayed
      }
      // Scroll to the bottom to simulate ChatGPT-style scrolling
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.all(20.0),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _displayText,
            style: const TextStyle(fontSize: 34),
          ),
        ),
      ],
    );
  }
}
