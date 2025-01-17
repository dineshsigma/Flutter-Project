import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MaterialApp(home: ColorPickerScreen()));
}

class ColorPickerScreen extends StatefulWidget {
  @override
  _ColorPickerScreenState createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  Color _currentColor = Colors.blue;  // Initial color

  // Method to show the color picker dialog
  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _currentColor,  // Current color
              onColorChanged: (Color color) {
                setState(() {
                  _currentColor = color;  // Update the color when picked
                });
              },
            // Show color labels (e.g., HEX)
              pickerAreaHeightPercent: 0.8,  // Customize picker area size
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),  // Close the dialog
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Optionally, you can use the color in other ways
                setState(() {
                  _currentColor = _currentColor;
                });
                Navigator.of(context).pop();  // Close the dialog
              },
              child: const Text('Select'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display selected color in a container
            Container(
              width: 100,
              height: 100,
              color: _currentColor,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showColorPicker,
              child: const Text('Pick Color'),
            ),
          ],
        ),
      ),
    );
  }
}
