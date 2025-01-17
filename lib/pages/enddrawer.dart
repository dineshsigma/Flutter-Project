import 'package:flutter/material.dart';

void main() {
  runApp(EndDrawer());
}

class EndDrawer extends StatelessWidget {
// This widget is the
// root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GeeksforGeeks"),
        backgroundColor: Colors.green,
      ),
      endDrawer: Drawer(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.list),
            title: Text("GFG item $index"),
            trailing: Icon(Icons.done),
          );
        }),
        //elevation: 20.0,
        //semanticLabel: 'endDrawer',
      ),
    );
  }
}
