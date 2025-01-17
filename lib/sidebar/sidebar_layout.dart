import 'package:flutter/material.dart';
import 'package:sample_project/pages/homepage.dart';
import 'package:sample_project/sidebar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  const SideBarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [SideBar()],
      ),
    );
  }
}
