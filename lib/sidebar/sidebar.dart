import 'package:flutter/material.dart';
import 'package:sample_project/pages/dashboard.dart';
import 'package:sample_project/pages/homepage.dart';
import 'package:sample_project/pages/myaccountspage.dart';
import 'package:sample_project/pages/myorders.dart';
import 'package:sample_project/pages/products.dart';
import 'package:sample_project/pages/settings.dart';
import 'package:sample_project/pages/users.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedIndex = 0; // Track the selected menu item index
  bool isSidebarOpen = true; // Track the sidebar's state (open/close)

  // List of pages corresponding to the sidebar menu
  final List<Widget> pages = [
    const Dashboard(),
    const HomePage(),
    const MyOrders(),
    const MyAccountspage(),
    const Products(),
    UserTableScreen(),
    const Settings(),
    
  ];

  //  @override
  // void initState() {
  //   super.initState();
  //   // Set the initial selected index based on the initial route
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final initialRoute = ModalRoute.of(context)?.settings.name;
  //     if (initialRoute != null) {
  //       _updateSelectedIndex(initialRoute);
  //     }
  //   });
  // }

  void _updateSelectedIndex(String route) {
    switch (route) {
      case '/dashboard':
        setState(() {
          selectedIndex = 0;
        });
        break;
      case '/home':
        setState(() {
          selectedIndex = 1;
        });
        break;
      case '/myorders':
        setState(() {
          selectedIndex = 2;
        });
        break;
      case '/myaccountpage':
        setState(() {
          selectedIndex = 3;
        });
        break;
      case '/products':
        setState(() {
          selectedIndex = 4;
        });
        break;
      case '/users':
        setState(() {
          selectedIndex = 5;
        });
        break;
      default:
        setState(() {
          selectedIndex = 0; // Default to HomePage
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          AnimatedContainer(
            duration: const Duration(milliseconds: 300), // Smooth animation
            width: isSidebarOpen ? 250 : 70, // Width of the sidebar
            color: Colors.blueGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar Header with Toggle Button
                Container(
                  padding: const EdgeInsets.all(7.5),
                  color: Colors.blueGrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isSidebarOpen
                          ? const Text(
                              "Menu",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox.shrink(),
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            isSidebarOpen = !isSidebarOpen; // Toggle sidebar
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Menu Items
                Expanded(
                  child: ListView(
                    children: [
                      _buildMenuItem(
                        icon: Icons.dashboard,
                        title: "Dashboard",
                        index: 0,
                        path: "/dashboard",
                      ),
                      _buildMenuItem(
                        icon: Icons.home,
                        title: "Homepage",
                        index: 1,
                        path: "/home",
                      ),
                      _buildMenuItem(
                        icon: Icons.shopping_cart,
                        title: "My Orders",
                        index: 2,
                        path: "/myorders",
                      ),
                      _buildMenuItem(
                        icon: Icons.account_circle,
                        title: "My Account",
                        index: 3,
                        path: "/myaccountpage",
                      ),
                      _buildMenuItem(
                        icon: Icons.list,
                        title: "Products",
                        index: 4,
                        path: "/products",
                      ),
                      _buildMenuItem(
                        icon: Icons.group,
                        title: "Users",
                        index: 5,
                        path: "/users",
                      ),
                      _buildMenuItem(
                        icon: Icons.settings,
                        title: "Settings",
                        index: 6,
                        path: "/settings",
                      )
                    ],
                  ),
                ),

                // Logout Option
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: isSidebarOpen
                      ? const Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        )
                      : null,
                  onTap: () {
                    // Handle logout logic here
                  },
                ),
              ],
            ),
          ),

          // Page Content
          Expanded(
            child: pages[selectedIndex], // Display the selected page
          ),
        ],
      ),
    );
  }

  // Helper method to build menu items
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required int index,
    required String path,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: isSidebarOpen
          ? Text(
              title,
              style: const TextStyle(color: Colors.white),
            )
          : null,
      onTap: () {
        setState(() {
          selectedIndex = index; // Update selected index
        });
        // Uncomment the following line to enable navigation
       //Navigator.pushReplacementNamed(context, path);
      },
    );
  }
}