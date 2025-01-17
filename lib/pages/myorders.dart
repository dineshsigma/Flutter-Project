import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/main.dart';
import 'package:sample_project/pages/custom_appbar.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
        builder: (context, counterProvider, child) {
      return  Scaffold(
          appBar: const CustomAppBar(title: "My Orders Count"),
          body: Center(
            child: Text('${counterProvider.count}'),
          ),);
    });
  }
}



// return const Center(
//       child: Text(
//         "MyOrders",
//         style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
//       ),
//     );