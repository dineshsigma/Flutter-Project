import 'package:flutter/material.dart';
import 'package:sample_project/pages/custom_appbar.dart';
import 'package:intl/intl.dart';
import 'package:sample_project/pages/productlist.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool isGridView = true;
  final List<Map<String, dynamic>> items = [
    {
      "id": 14,
      "product_name": "Apple iPad Mini Cellular 7.9 inch Pink 256GB",
      "linker": "Farah Ettles",
      "product_price": 25000,
      "product_img":
          "https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp"
    },
    {
      "id": 15,
      "product_name": "Apple iPad Mini Wifi 7.9 inch Gold 256GB",
      "linker": "apple-ipad-mini-wifi-7-9-inch-gold-256gb",
      "product_price": 35000,
      "product_img":
          "https://s3.ap-south-1.amazonaws.com/happimobiles/product-main-images/Apple-iPad-Mini-8-3-Inch-WiFi-6th-Generation-pink-front-back.webp"
    },
    {
      "id": 16,
      "product_name": "Wallis Timmermann",
      "linker": "Farah Ettles",
      "product_price": 14,
      "product_img":
          "https://happimobiles.s3.amazonaws.com/product/14a5c470-9f79-11ec-b6cb-21e9b0e0cbbd/0d1eecbe-35fc-4c30-879b-d570669e752c.webp"
    },
    {
      "id": 17,
      "product_name": "Wallis Timmermann",
      "linker": "Farah Ettles",
      "product_price": 14,
      "product_img":
          "https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp"
    },
    {
      "id": 18,
      "product_name": "Wallis Timmermann",
      "linker": "Farah Ettles",
      "product_price": 14,
      "product_img":
          "https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp"
    },
    {
      "id": 19,
      "product_name": "Wallis Timmermann",
      "linker": "Farah Ettles",
      "product_price": 14,
      "product_img":
          "https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp"
    },
    {
      "id": 19,
      "product_name": "Wallis Timmermann",
      "linker": "Farah Ettles",
      "product_price": 14,
      "product_img":
          "https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp"
    },
    {
      "id": 19,
      "product_name": "Wallis Timmermann",
      "linker": "Farah Ettles",
      "product_price": 14,
      "product_img":
          "https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp"
    },
    {
      "id": 19,
      "product_name": "Wallis Timmermann",
      "linker": "Farah Ettles",
      "product_price": 14,
      "product_img":
          "https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp"
    },
    {
      "id": 19,
      "product_name": "Wallis Timmermann",
      "linker": "Farah Ettles",
      "product_price": 14,
      "product_img":
          "https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp"
    },
    {
      "id": 19,
      "product_name": "Wallis Timmermann",
      "linker": "Farah Ettles",
      "product_price": 14,
      "product_img":
          "https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp"
    },
    {
      "id": 19,
      "product_name": "Wallis Timmermann",
      "linker": "Farah Ettles",
      "product_price": 14,
      "product_img":
          "https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp"
    },
    {
      "id": 19,
      "product_name": "Wallis Timmermann",
      "linker": "Farah Ettles",
      "product_price": 14,
      "product_img":
          "https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp"
    },
    {
      "id": 19,
      "product_name": "Wallis Timmermann",
      "linker": "Farah Ettles",
      "product_price": 14,
      "product_img":
          "https://happimobiles.s3.ap-south-1.amazonaws.com/product-main-images/happi_mobiles_oppo_find_x8_grey_main_image.webp"
    }
  ];
  // Original data
  List<Map<String, dynamic>> filteredItems = []; // Filtered data for search
  final TextEditingController searchController = TextEditingController();

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
        filteredItems = items;
        searchController.clear(); // Show all items when search is cleared
      });
    } else {
      setState(() {
        filteredItems = items
            .where((item) => item['product_name']
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      });
    }
  }

 String convertToIndianCurrency(double price, {int decimalDigits = 2}) {
  return NumberFormat.currency(
    locale: 'en_IN', // Locale for India
    symbol: '₹',     // Indian Rupee symbol
    decimalDigits: decimalDigits,
  ).format(price);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Products"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isGridView = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              !isGridView ? Colors.blue : Colors.grey),
                      child: const Text('List View'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isGridView = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isGridView ? Colors.blue : Colors.grey),
                      child: const Text('Grid View'),
                    ),
                    Container(
                      width: 250, // Reduced width for the search bar
                      height: 40, // Reduced height for the search bar
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search names",
                          prefixIcon:
                              const Icon(Icons.search), // Search icon as prefix
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              searchController.clear();
                              filterItems(''); // Clear search and reset items
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true, // Enables background color
                          fillColor: Colors.grey[200], // Light background color
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 16), // Adjusts inner padding
                        ),
                        onChanged: filterItems,
                      ),
                    )
                  ],
                ),

                const SizedBox(width: 10),
                // Push the search bar to the right
              ],
            ),
            const SizedBox(height: 20),
            // Add the rest of your UI here

            const SizedBox(width: 10),
            Expanded(
              child: isGridView ? buildGridView() : buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Two items per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        // childAspectRatio: 0.4,
        mainAxisExtent: 300, // Adjust aspect ratio to make cards taller
      ),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        return GestureDetector(
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(product: item), // Pass the product object
              ),
            );
          },
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center content vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center content horizontally
              children: [
                // Product Image
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Tooltip(
                        message: 'add to cart',
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_bag_rounded),
                          color: Colors.blueGrey,
                        ),
                      ),
                      Tooltip(
                        message: 'wishlist',
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_rounded),
                          color:Colors.red
                        ),
                      )
                    ],
                  ),
                ),
                ClipRRect(
                  // borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    item['product_img'],
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name
                      Text(
                        item['product_name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Product Price
                      Text(
                        convertToIndianCurrency(item['product_price']),
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Linker (additional field)
                      Text(
                        "Linker: ${item['linker']}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      //padding: const EdgeInsets.all(10),
    );
  }

  // Build ListView
  Widget buildListView() {
    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
          final item = filteredItems[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Colors.blueAccent,
          child: ListTile(
            title: Text(
              item['product_name'],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
