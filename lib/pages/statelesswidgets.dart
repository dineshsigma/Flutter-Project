import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ImmutableWidgets extends StatelessWidget {
  const ImmutableWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widgets'),
      ),
      body: const Center(
        child: Text('StateLess Widgets Body'),
      ),
    );
  }
}
