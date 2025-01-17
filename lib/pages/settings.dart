import 'package:flutter/material.dart';
import 'package:sample_project/pages/custom_appbar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      body:SingleChildScrollView(
        

      )
    );
  }
}