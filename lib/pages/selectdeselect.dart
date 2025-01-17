import 'package:flutter/material.dart';

class SelectAllExample extends StatefulWidget {
  @override
  _SelectAllExampleState createState() => _SelectAllExampleState();
}

class _SelectAllExampleState extends State<SelectAllExample> {
  // List of items
  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];

  // Map to keep track of selected items
  Map<String, bool> selectedItems = {};

  // Track the state of the "Select All" checkbox
  bool isSelectAllChecked = false;

  @override
  void initState() {
    super.initState();
    // Initialize all items as unchecked
    for (var item in items) {
      selectedItems[item] = false;
    }
  }

  void toggleSelectAll(bool? value) {
    setState(() {
      isSelectAllChecked = value ?? false;
      for (var key in selectedItems.keys) {
        selectedItems[key] = isSelectAllChecked;
      }
    });
  }

  void toggleItemSelection(String item, bool? value) {
    setState(() {
      selectedItems[item] = value ?? false;

      // Update "Select All" checkbox based on individual selections
      isSelectAllChecked = !selectedItems.containsValue(false);
    });
  }

  List<String> getSelectedItems() {
    return selectedItems.entries
        .where((entry) => entry.value == true) // Only selected items
        .map((entry) => entry.key) // Get item names
        .toList();
  }

  void showSelectedItems() {
    List<String> selected = getSelectedItems();
    print(selected);
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: Text("Selected Items"),
    //     content: selected.isEmpty
    //         ? Text("No items selected!")
    //         : Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: selected.map((item) => Text(item)).toList(),
    //           ),
    //     actions: [
    //       TextButton(
    //         onPressed: () => Navigator.pop(context),
    //         child: Text("Close"),
    //       ),
    //     ],
    //   ),
    //);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select All Example"),
      ),
      body: Column(
        children: [
          // Select All Checkbox
          CheckboxListTile(
            title: Text("Select All"),
            value: isSelectAllChecked,
            onChanged: toggleSelectAll,
          ),

          // List of Checkboxes
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                String item = items[index];
                return CheckboxListTile(
                  title: Text(item),
                  value: selectedItems[item],
                  onChanged: (value) => toggleItemSelection(item, value),
                );
              },
            ),
          ),

          // Button to display selected items
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: showSelectedItems,
              child: Text('Click Here'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SelectAllExample(),
  ));
}
