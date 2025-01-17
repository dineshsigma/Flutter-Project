
import 'package:flutter/material.dart';

class MyNestedScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        // The headerSliverBuilder callback defines the sliver widgets in the header
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            // SliverAppBar is the header that remains visible while scrolling
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Nested Scroll View Example',
                  style: TextStyle(fontSize: 16), // Customize the title's style
                ),
                background: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf9fG0XSXlw5HHtdVIhc1_gl4vzcKeCOAkoBD07BHiTAyvsVoKqvRbLkwuNSTheOd3Kk4&usqp=CAU',
                  fit: BoxFit.cover, // Ensure the image covers the entire area
                ),
              ),
            ),
          ];
        },
        // The body contains the scrollable content
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Item $index'), // Display a list of items
            );
          },
        ),
      ),
    );
  }
}
