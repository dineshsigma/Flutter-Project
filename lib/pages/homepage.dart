import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/main.dart';
import 'package:sample_project/pages/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
   @override
  void dispose() {
    print("Callimng Dispose Method");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Consumer<CounterProvider>(
      builder: (context, counterProvider, child) {
        return Scaffold(
          appBar: const CustomAppBar(title: "Home Page"),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Count:',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '${counterProvider.count}',
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Step 4: Trigger state update
              counterProvider.increment();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
