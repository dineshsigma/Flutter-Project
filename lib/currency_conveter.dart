import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sample_project/sidebar/sidebar_layout.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  bool _isPasswordVisible = false;
  String? _passwordError;

  void login(String email, String password) async {
    if (!_formKey.currentState!.validate()) return;

    try {
      http.Response response = await http.post(
        Uri.parse('http://ec2-13-233-67-195.ap-south-1.compute.amazonaws.com:8082/api/CRM/v1/login'),
        headers: {
          'client-code': 'myhome',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "user_type_id": "customer",
          "password": password,
          "pan_card": email,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String token = data['data']['sessionDetails']['token'];

        await _secureStorage.write(key: 'accessToken', value: token);
        _emailController.clear();
        _passwordController.clear();

        setState(() => _passwordError = null);

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const SideBarLayout()),
        // );
        Navigator.popAndPushNamed(
          context,
          '/sidebarlayout',
        );
      } else {
        setState(() {
          _passwordError = "Invalid email or password";
        });
      }
    } catch (error) {
      setState(() {
        _passwordError = "Something went wrong. Please try again.";
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 600;

    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      borderSide: BorderSide(width: 2.0),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    'https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg',
                    height: isDesktop ? 150 : 100,
                    width: isDesktop ? 150 : 100,
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isDesktop ? 200 : 40),
                    child: TextFormField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        hintStyle: TextStyle(
                          color: Colors.white60,
                          fontSize: isDesktop ? 16 : 14,
                        ),
                        prefixIcon: const Icon(Icons.email),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isDesktop ? 200 : 40),
                    child: TextFormField(
                      controller: _passwordController,
                      style: const TextStyle(color: Colors.black),
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: TextStyle(
                          color: Colors.white60,
                          fontSize: isDesktop ? 16 : 14,
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  if (_passwordError != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 200 : 40),
                      child: Text(
                        _passwordError!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login(_emailController.text, _passwordController.text);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
