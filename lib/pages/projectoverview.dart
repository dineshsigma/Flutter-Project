import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProjectOverview extends StatelessWidget {
  const ProjectOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Row(
              children: const [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Project OverView',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                 Spacer(),
                Icon(Icons.more_vert),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
