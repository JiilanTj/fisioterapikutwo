import 'package:flutter/material.dart';
import 'package:fisioterapiku/constants.dart';
import 'package:fisioterapiku/pages/home.dart';
import 'package:fisioterapiku/pages/admin.dart';
import 'package:fisioterapiku/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0; // Mulai dengan menu Home terpilih

  final List<Widget> screens = [
    HomePage(),
    AdminPage(), // Placeholder untuk menu Admin (Anda bisa ganti dengan halaman Admin yang sesuai)
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: screens[currentTab],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          selectedItemColor: kprimaryColor,
          unselectedItemColor: Colors.grey.shade400,
          currentIndex: currentTab,
          onTap: (index) {
            setState(() {
              currentTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings),
              label: 'Admin',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
