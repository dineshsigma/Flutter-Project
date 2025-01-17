import 'package:flutter/material.dart';

class ScrollControllerExample extends StatefulWidget {
  @override
  _ScrollControllerExampleState createState() =>
      _ScrollControllerExampleState();
}

class _ScrollControllerExampleState extends State<ScrollControllerExample> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // _scrollController.addListener(() {
    //   // Listen to scroll position
    //   print("Current scroll position: ${_scrollController.offset}");
    // });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose controller when done
    super.dispose();
  }

  void scrollToBottom() {
    print(_scrollController.position.maxScrollExtent);
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent, // Scroll to bottom
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut
    );
  }



  void scrollToTop() {
    _scrollController.animateTo(
      0.0, // Scroll to top
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScrollController Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              primary: false,
              controller: _scrollController, // Attach ScrollController
              child: Column(
                children: List.generate(
                  50,
                  (index) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Item $index',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: scrollToTop,
                child: const Text('Scroll to Top'),
              ),
              ElevatedButton(
                onPressed: scrollToBottom,
                child: const Text('Scroll to Bottom'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ScrollControllerExample()));
}
