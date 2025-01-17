import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: AutoCarouselExample()));

class AutoCarouselExample extends StatefulWidget {
  @override
  _AutoCarouselExampleState createState() => _AutoCarouselExampleState();
}

class _AutoCarouselExampleState extends State<AutoCarouselExample> {
  late PageController _pageController;
  int _currentPage = 0;
  final List<String> _imageUrls = [
    'https://via.placeholder.com/600x300/33FF57/FFFFFF?text=Image+2',
    'https://via.placeholder.com/600x300/33FF57/FFFFFF?text=Image+2',
    'https://via.placeholder.com/600x300/3357FF/FFFFFF?text=Image+3',
    'https://via.placeholder.com/600x300/57FF33/FFFFFF?text=Image+4',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Automatically change pages every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        // Move to the next image
        _currentPage = (_currentPage + 1) % _imageUrls.length; // This ensures it loops back to the first image after the last one
      });

      // Animate to the next page
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Carousel Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the PageView carousel
            SizedBox(
              height: 300,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    _imageUrls[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
