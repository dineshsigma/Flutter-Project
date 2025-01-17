import 'package:flutter/material.dart';
import 'package:sample_project/pages/custom_appbar.dart';
import 'package:sample_project/pages/dailytask.dart';
import 'package:sample_project/pages/monthlytarget.dart';
import 'package:sample_project/pages/projectoverview.dart';
import 'package:sample_project/pages/projectstatistics.dart';
import 'package:sample_project/pages/projectsummary.dart';
import 'package:sample_project/pages/teammembers.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(title: "Dashboard"),
      body: SingleChildScrollView( // Allow scrolling
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Breadcrumb
              Row(
                children: [
                  const Text(
                    'Project',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Text('WebUi', style: TextStyle(fontSize: 14)),
                      Icon(Icons.arrow_right_outlined),
                      Text('Dashboard', style: TextStyle(fontSize: 14)),
                      Icon(Icons.arrow_right_outlined),
                      Text('Projects', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Cards Grid
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 1200 ? 4 : 2, // Responsive columns
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.7, // Adjust ratio for better card size
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  cards[index]['title']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.more_horiz, color: Colors.grey[600]),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cards[index]['description']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(Icons.alarm, size: 16, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text(
                                cards[index]['time']!,
                                style: const TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              // Reduced gap between the cards and next section
              const SizedBox(height: 10), // Reduced gap

              // Row for Project Summary and Doughnuts
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                  //  flex: 2,
                    child: ProjectSummary(), // Project summary widget
                  ),
                  const SizedBox(width: 3), // Reduced space
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const SizedBox(
                            width: 400, // Increased width for the first doughnut chart
                            height: 400, // Increased height for the first doughnut chart
                            child: MonthlyTarget(), // Doughnut chart
                          ),
                        ),
                        const SizedBox(width: 2), // Reduced space
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const SizedBox(
                            width: 520, // Adjusted width for the second doughnut chart
                            height: 400, // Increased height for the second doughnut chart
                            child:  ProjectStatics(), // Second doughnut chart
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
//----------------------------------------- Third Row Graphs Start here ------------------------------------
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                  //  flex: 2,
                    child: DailyTask(), // Project summary widget
                  ),
                  const SizedBox(width: 3), // Reduced space
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 400, // Increased width for the first doughnut chart
                          height: 400, // Increased height for the first doughnut chart
                          child: TeamMeamber(), // Doughnut chart
                        ),
                       SizedBox(width: 2), // Reduced space
                        SizedBox(
                          width: 520, // Adjusted width for the second doughnut chart
                          height: 400, // Increased height for the second doughnut chart
                          child:  ProjectOverview(), // Second doughnut chart
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}