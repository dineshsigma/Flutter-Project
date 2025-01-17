import 'package:flutter/material.dart';

// Define the Person model
class Person {
  final String name;
  final String photoUrl;
  final int age;
  final String gender;
  final String profession;

  Person({
    required this.name,
    required this.photoUrl,
    required this.age,
    required this.gender,
    required this.profession,
  });
}

// Create the PersonListWidget
class PersonListWidget extends StatelessWidget {
  final List<Person> personList;

  // Accept the person list as a parameter
  PersonListWidget({required this.personList});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: personList.length,
      itemBuilder: (context, index) {
        final person = personList[index];
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, // 5% padding on both sides
            vertical: 10, // Vertical padding
          ),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.1, // Adjust avatar size
                    backgroundImage: NetworkImage(person.photoUrl),
                  ),
                  SizedBox(width: screenWidth * 0.05), // Responsive spacing
                  Expanded( // Ensures the text fits properly
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ${person.name}",
                          style: TextStyle(
                            fontSize: screenWidth * 0.045, // Dynamic font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5), // Small spacing between lines
                        Text(
                          "Age: ${person.age}",
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                        Text(
                          "Gender: ${person.gender}",
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                        Text(
                          "Profession: ${person.profession}",
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
