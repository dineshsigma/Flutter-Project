import 'package:flutter/material.dart';

class ProjectSummary extends StatelessWidget {
  const ProjectSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth > 300 ? 350 : screenWidth * 0.9,
      height: 410, 
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
        child: Column(
          children: [
            Row(
              children: const [
                SizedBox(height: 10), 
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Project Summary',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),
            const SizedBox(height: 8), 
            Container(
              padding: const EdgeInsets.all(0),
              margin:
                  const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
              height: 40,
              child: Card(
                color: Color.fromARGB(255, 199, 208, 63),
                child: Row(
                  children: [
                    Container(
                      color: Colors
                          .transparent, 
                      child: Icon(
                        Icons.folder_open_rounded,
                        size: 25,
                        color:
                            Colors.amber[200], 
                      ),
                    ),
                    const SizedBox(width: 8), 
                    const Text(
                      '10 Total Projects',
                      style: TextStyle(color: Colors.limeAccent),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.people, color: Colors.blue),
                        ),
                        title: Text('Project Discussion'),
                        subtitle: Text('16 Person'),
                        trailing: Icon(Icons.info),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          child:
                              Icon(Icons.hourglass_empty, color: Colors.yellow),
                        ),
                        title: Text('In Progress'),
                        subtitle: Text('20 Person'),
                        trailing: Icon(Icons.info),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Card(
                        margin:  EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.check_circle, color: Colors.red),
                          ),
                          title: Text('Complete Project'),
                          subtitle: Text('10 Person'),
                          trailing:  Icon(Icons.info),
                        ),
                      )),
                  Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Card(
                      margin:  EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.send, color: Colors.green),
                        ),
                        title: Text('Delivary Project'),
                        subtitle: Text('16 Person'),
                        trailing:  Icon(Icons.info),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
