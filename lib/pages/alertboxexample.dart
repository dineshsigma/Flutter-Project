import 'package:flutter/material.dart';

class AlertBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Box Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Alert Box"),
                  content: Text("This is an alert box with some content."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the alert box
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        print("Confirmed!");
                      },
                      child: Text("Confirm"),
                    ),
                  ],
                );
              },
            );
          },
          child: Text("Show Alert Box"),
        ),
      ),
    );
  }
}
