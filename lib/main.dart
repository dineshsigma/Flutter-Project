import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/currency_conveter.dart';
import 'package:sample_project/pages/alertboxexample.dart';
import 'package:sample_project/pages/bottomsheet.dart';
import 'package:sample_project/pages/carousel.dart';
import 'package:sample_project/pages/chatgpt.dart';
import 'package:sample_project/pages/colorpicker.dart';
import 'package:sample_project/pages/dashboard.dart';
import 'package:sample_project/pages/enddrawer.dart';
import 'package:sample_project/pages/gesture.dart';
import 'package:sample_project/pages/graphx.dart';
import 'package:sample_project/pages/grid.dart';
import 'package:sample_project/pages/homepage.dart';
import 'package:sample_project/pages/myaccountspage.dart';
import 'package:sample_project/pages/myorders.dart';
import 'package:sample_project/pages/myscrollwidget.dart';
import 'package:sample_project/pages/nested_scrollwidget.dart';
import 'package:sample_project/pages/personlistwidget.dart';
import 'package:sample_project/pages/productlist.dart';
import 'package:sample_project/pages/products.dart';
import 'package:sample_project/pages/radiobutton.dart';
import 'package:sample_project/pages/register.dart';
import 'package:sample_project/pages/selectdeselect.dart';
import 'package:sample_project/pages/settings.dart';
import 'package:sample_project/pages/statefullwidgets.dart';
import 'package:sample_project/pages/statelesswidgets.dart';
import 'package:sample_project/pages/users.dart';
import 'package:sample_project/sidebar/sidebar_layout.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Step 1: Create a data provider class
class CounterProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}

void main  () async {
    final FlutterSecureStorage _getsecureStorage = const FlutterSecureStorage();
    String? token = await _getsecureStorage.read(key: 'accessToken');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterProvider()),
    ],
    child: const MyApp(),
  ));
}

final personList = [
      Person(
        name: "John Doe",
        photoUrl: "https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg",
        age: 28,
        gender: "Male",
        profession: "Software Developer",
      ),
      Person(
        name: "Jane Smith",
        photoUrl: "https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg",
        age: 25,
        gender: "Female",
        profession: "Graphic Designer",
      ),
      Person(
        name: "Sam Wilson",
        photoUrl: "https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg",
        age: 30,
        gender: "Male",
        profession: "Doctor",
      ),
      Person(
        name: "Emily Davis",
        photoUrl: "https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg",
        age: 22,
        gender: "Female",
        profession: "Teacher",
      ),
      Person(
        name: "Emily Davis",
        photoUrl: "https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg",
        age: 22,
        gender: "Female",
        profession: "Teacher",
      ),
      Person(
        name: "Emily Davis",
        photoUrl: "https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg",
        age: 22,
        gender: "Female",
        profession: "Teacher",
      ),
      Person(
        name: "Emily Davis",
        photoUrl: "https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg",
        age: 22,
        gender: "Female",
        profession: "Teacher",
      ),
      Person(
        name: "Emily Davis",
        photoUrl: "https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg",
        age: 22,
        gender: "Female",
        profession: "Teacher",
      ),
      Person(
        name: "Emily Davis",
        photoUrl: "https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg",
        age: 22,
        gender: "Female",
        profession: "Teacher",
      ),
      Person(
        name: "Emily Davis",
        photoUrl: "https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg",
        age: 22,
        gender: "Female",
        profession: "Teacher",
      ),
      Person(
        name: "Emily Davis",
        photoUrl: "https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg",
        age: 22,
        gender: "Female",
        profession: "Teacher",
      ),
      Person(
        name: "Emily Davis",
        photoUrl: "https://real-estate-crm-documents.s3.ap-south-1.amazonaws.com/prodiscoverimg.jpg",
        age: 22,
        gender: "Female",
        profession: "Teacher",
      ),
    ];


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();

  
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal, // Generates primary and other colors
        ),
      ),
      //home:  EndDrawer(),
      // home: SignUpPage(),
       //home :const CurrencyConverterMaterialPage(),
     // home: PersonListWidget(personList: personList),
     home:AlertBoxExample(),
      routes: {
        '/home': (context) => const HomePage(),
        '/myorders': (context) => const MyOrders(),
        '/myaccountpage': (context) => const MyAccountspage(),
        '/sidebarlayout': (context) => const SideBarLayout(),
        '/products' :(context) => const Products(),
        '/users' : (context) =>  UserTableScreen(),
        '/product/:id' : (context) => const ProductDetails(product: {}),
        '/settings' : (context) => const Settings(),
        '/dashboard' : (context) => const Dashboard()
      },
    );
  }
}







