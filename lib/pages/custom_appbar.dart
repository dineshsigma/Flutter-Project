import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20), // Adjust font size if needed
          ),
          const Spacer(), // Pushes the profile info to the right
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text('Gundelugunta Dinesh'),
                const SizedBox(width: 8), // Space between text and image
                ClipOval( // Use ClipOval for circular image
                  child: Image.network(
                    'https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp',
                    height: 40, // Set height for the image
                    width: 40, // Set width for the image
                    fit: BoxFit.cover, // Ensure the image covers the area
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}