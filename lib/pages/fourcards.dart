import 'package:flutter/material.dart';

class FourCards extends StatefulWidget {
  const FourCards({super.key});

  @override
  State<FourCards> createState() => _FourCardsState();
}

class _FourCardsState extends State<FourCards> {
  final List<Map<String, String>> cards = [
    {
      'title': 'Project Dashboard',
      'description': 'Update Dashboard',
      'time': '1 Hr ago',
      'icon': '👤',
    },
    {
      'title': 'Admin Template',
      'description': 'Update Template',
      'time': '5 Hrs ago',
      'icon': '👥',
    },
    {
      'title': 'Client Project',
      'description': 'Update Client',
      'time': '10 Hrs ago',
      'icon': '🧑‍💼',
    },
    {
      'title': 'Figma Design',
      'description': 'Update Figmo',
      'time': '5 Days ago',
      'icon': '🎨',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return
      
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust to display 2 cards per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 2, // Controls card height/width ratio
          ),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cards[index]['icon']!,
                      style: TextStyle(fontSize: 32),
                    ),
                    SizedBox(height: 8),
                    Text(
                      cards[index]['title']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      cards[index]['description']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      cards[index]['time']!,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    
  }
}
