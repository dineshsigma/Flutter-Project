import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:html' as html; // For Web

class FilePickerExample extends StatefulWidget {
  @override
  _FilePickerExampleState createState() => _FilePickerExampleState();
}

class _FilePickerExampleState extends State<FilePickerExample> {
  // Variable to hold the selected file
  File? selectedFile;
  String? imageUrl; // For web image
  String? errorMessage;

  // Allowed image file formats
  final List<String> allowedFormats = ['jpg', 'jpeg', 'png' ,'.webp'];

  void pickFile() async {
    try {
      if (kIsWeb) {
        // For Web, use the html library to pick files
       
        final html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
        uploadInput.accept = 'image/*'; // Accepts images only
        uploadInput.click();

        uploadInput.onChange.listen((e) {
          final files = uploadInput.files;
          if (files!.isEmpty) return;
          final file = files[0]; // Get the first selected file.
          
          // Extract file extension to check if it's allowed
          String fileExtension = file.name.split('.').last.toLowerCase();

          if (!allowedFormats.contains(fileExtension)) {
            // If the file format is not allowed
            setState(() {
              errorMessage = 'Only JPG, JPEG, and PNG formats are allowed.';
              imageUrl = null; // Clear the image URL if invalid file format
            });
            print(errorMessage);
            return;
          }

          // Convert the file to a URL using FileReader
          final reader = html.FileReader();
          reader.readAsDataUrl(file);
          reader.onLoadEnd.listen((e) {
            setState(() {
              imageUrl = reader.result as String?;
              errorMessage = null; // Clear any previous error message
             
            });
          });

          print("File Name (Web): ${file.name}");
          print("File Size (Web): ${file.size}");
        });
      } else {
        // For Mobile/Desktop, use file_picker
        print("Running on Mobile/Desktop");
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          // Extract file extension to check if it's allowed
          String fileExtension = result.files.single.name.split('.').last.toLowerCase();

          if (!allowedFormats.contains(fileExtension)) {
            // If the file format is not allowed
            setState(() {
              errorMessage = 'Only JPG, JPEG, and PNG formats are allowed.';
              selectedFile = null; // Clear the selected file if invalid format
            });
            print(errorMessage);
            return;
          }

          setState(() {
            selectedFile = File(result.files.single.path!); // Store the selected file
            errorMessage = null; // Clear any previous error message
          });
          print("File Name: ${result.files.single.name}");
          print("File Path: ${result.files.single.path}");
        } else {
          print("No file selected.");
        }
      }
    } catch (e) {
      setState(() {
        errorMessage = "Error: $e";
      });
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Picker Example"),
      
      ),
    
      body: SingleChildScrollView(
        child: Center(
         
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: pickFile,
                child: Text("Pick File"),
                
              ),
              SizedBox(height: 20),
              // Display error message if file format is not allowed
              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 20),
              // Display the selected image (Web)
              if (imageUrl != null)
                Image.network(imageUrl!) // Display image for Web
              else if (selectedFile != null)
                Image.file(selectedFile!) // Display image for mobile/desktop
              else
                Text("No image selected."),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: FilePickerExample()));
