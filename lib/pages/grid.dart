import 'package:flutter/material.dart';

class ToggleViewExample extends StatefulWidget {
   const ToggleViewExample({super.key});
  @override
  _ToggleViewExampleState createState() => _ToggleViewExampleState();
}

class _ToggleViewExampleState extends State<ToggleViewExample> {
  bool isGridView = true; // Control the current view (GridView/ListView)
  final List<String> items = ['Ramya','Dinesh','Vinod','Hema','Mahi','Teja','Sankar','Balaji','Mayanak','Vikas','writick','Madhav','keerthi']; 
  // Original data
  List<String> filteredItems = []; // Filtered data for search
  TextEditingController searchController = TextEditingController(); // Controller for search input

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    print(filteredItems.length);
   // Initialize with all items
  }

  void filterItems(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredItems = items; // Show all items when search is cleared
      });
    } else {
      setState(() {
        filteredItems = items
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toggle Between List and Grid View"),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: "Search names",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          filterItems(''); // Clear search and reset items
                        },
                      ),
                    ),
                    onChanged: filterItems, // Update search results on input
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
          const Divider(),

          // Toggle buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isGridView = false; // Switch to ListView
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: !isGridView ? Colors.blue : Colors.grey,
                ),
                child: const Text("List View"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isGridView = true; // Switch to GridView
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isGridView ? Colors.blue : Colors.grey,
                ),
                child: const Text("Grid View"),
              ),
            ],
          ),
          const Divider(),

          // Content based on the selected view mode
          Expanded(
            child: isGridView ? buildGridView() : buildListView(),
          ),
        ],
      ),
    );
  }


//https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp
  // Build GridView
  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Two items per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.purple,
          child: Center(
            child: Text(
              filteredItems[index],
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        );
      },
      padding: const EdgeInsets.all(10),
    );
  }

  // Build ListView
  Widget buildListView() {
    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        return Card(
          margin:const  EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Colors.blueAccent,
          child: ListTile(
            title: Text(
              filteredItems[index],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ToggleViewExample(),
  ));
}
