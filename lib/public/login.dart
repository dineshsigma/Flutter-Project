import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  // Text controllers for the input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Password visibility toggle state
  bool _isPasswordVisible = false;

  @override
  void dispose() {
     print("Calling Dispose Method");
    // Dispose controllers to free up resources
    _emailController.dispose();
    _passwordController.dispose();
    print("Calling Dispose Method");
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      borderSide: BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              '../public/proimage.svg',
              height: 150,
              width: 150,
              //fit :BoxFit.contain
            ),

            const SizedBox(
                height: 16.0), // Spacing between Image and Email field
            TextField(
              controller: _emailController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Enter Email",
                hintStyle: const TextStyle(color: Colors.white60),
                prefixIcon: const Icon(Icons.email),
                prefixIconColor: Colors.white,
                focusedBorder: border,
                enabledBorder: border,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              style: const TextStyle(color: Colors.black),
              obscureText: !_isPasswordVisible, // Toggle password visibility
              decoration: InputDecoration(
                hintText: "Enter Password",
                hintStyle: const TextStyle(color: Colors.white60),
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor: Colors.white,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible; // Toggle state
                    });
                  },
                ),
                focusedBorder: border,
                enabledBorder: border,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24.0), // Spacing before Login button
            TextButton(
              onPressed: () {
                // Perform login logic here
                final email = _emailController.text;
                final password = _passwordController.text;

                // Example: Print the entered email and password

                //print("Login SucecessFully");
                //debugPrint('Login Successfully');
                if (kDebugMode) {
                  print("Login SucecessFully");
                  print('Email: $email');
                  print('Password: $password');
                   _emailController.clear();
                   _passwordController.clear();
                }else{

                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black, // Button background color
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 20), // Padding inside the button
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white, // Button text color
                  fontSize: 13.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
