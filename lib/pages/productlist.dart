import 'package:flutter/material.dart';
import 'package:sample_project/pages/custom_appbar.dart';

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> product; // Accept product data

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Product Details"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display product image
            Image.network(
              product['product_img'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            // Display product name
            Text(
              product['product_name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Display product price
            Text(
              'Price: ₹${product['product_price']}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 8),
            // Display linker
            Text(
              'Linker: ${product['linker']}',
              style: const TextStyle(fontSize: 16),
            ),
            // Add more product details as needed
          ],
        ),
      ),
    );
  }
}