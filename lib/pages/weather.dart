import 'dart:ui';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              // print('Refresh is Clicked');
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: const [
                          Text(
                            '300°F',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 70,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Rain',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: Card(
                        elevation: 6,
                        child: Column(children: const [
                          Text(
                            '3:30',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                           SizedBox(height: 8),
                           Icon(Icons.cloud,size: 32),
                           SizedBox(height: 8),
                           Text(
                            '320.12',
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: Card(
                        elevation: 6,
                        child: Column(children: const [
                          Text(
                            '3:30',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                           SizedBox(height: 8),
                           Icon(Icons.cloud,size: 32),
                           SizedBox(height: 8),
                           Text(
                            '320.12',
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: Card(
                        elevation: 6,
                        child: Column(children: const [
                          Text(
                            '3:30',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                           SizedBox(height: 8),
                           Icon(Icons.cloud,size: 32),
                           SizedBox(height: 8),
                           Text(
                            '320.12',
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: Card(
                        elevation: 6,
                        child: Column(children: const [
                          Text(
                            '3:30',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                           SizedBox(height: 8),
                           Icon(Icons.cloud,size: 32),
                           SizedBox(height: 8),
                           Text(
                            '320.12',
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: Card(
                        elevation: 6,
                        child: Column(children: const [
                          Text(
                            '3:30',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                           SizedBox(height: 8),
                           Icon(Icons.cloud,size: 32),
                           SizedBox(height: 8),
                           Text(
                            '320.12',
                          ),
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Weather Forecast Cards
            // const Placeholder(
            //   fallbackHeight: 150,
            //   //child: Text('Main card'),
            // ),
            const SizedBox(height: 20),
            // WAdditional Information
            const Placeholder(
              fallbackHeight: 150,
              //child: Text('Main card'),
            ),
          ],
        ),
      ),
    );
  }
}