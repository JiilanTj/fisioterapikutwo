import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fisioterapiku/pages/main_screen.dart';
import 'package:fisioterapiku/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Check FirebaseAuth user status
  User? user = FirebaseAuth.instance.currentUser;
  Widget initialScreen;

  if (user != null) {
    // User is already logged in
    initialScreen = MainScreen();
  } else {
    // User is not logged in, redirect to login page
    initialScreen = LoginPage();
  }

  runApp(MyApp(initialScreen: initialScreen));
}

class MyApp extends StatelessWidget {
  final Widget initialScreen;

  const MyApp({required this.initialScreen, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        // Other theme configurations
      ),
      home: initialScreen,
    );
  }
}
