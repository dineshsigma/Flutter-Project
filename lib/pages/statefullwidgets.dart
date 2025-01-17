import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MuttableWidgets extends StatefulWidget {
  const MuttableWidgets({super.key});

  @override
  State<MuttableWidgets> createState() => _MuttableWidgetsState();
}




class _MuttableWidgetsState extends State<MuttableWidgets> {

  Color _backgroundColor = Colors.green;

void chnageColor(){
// setState(() {
      _backgroundColor = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1, // Fully opaque
      );
   // });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatefUll Widgets'),
      ),
      body: AnimatedContainer(
        duration:const Duration(milliseconds: 500),
        color:_backgroundColor,
        child: Center(
          child: ElevatedButton(onPressed: chnageColor, child: const Text('Change the COlor'))

        ),
      ),
    );
  }
}
