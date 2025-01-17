import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Summary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10.0), // Padding for the title
              child: const Text(
                'Project Summary',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10), // Set left and right margins to 0
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '10 Total Projects',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ProjectCard(
                    title: 'Project Discussion',
                    count: '16 Person',
                    icon: Icons.people,
                    color: Colors.blue,
                  ),
                  ProjectCard(
                    title: 'In Progress',
                    count: '20 Projects',
                    icon: Icons.hourglass_empty,
                    color: Colors.yellow,
                  ),
                  ProjectCard(
                    title: 'Complete Project',
                    count: '30',
                    icon: Icons.check_circle,
                    color: Colors.red,
                  ),
                  ProjectCard(
                    title: 'Delivery Project',
                    count: '15',
                    icon: Icons.send,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color color;

  const ProjectCard({
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(title),
        subtitle: Text(count),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}