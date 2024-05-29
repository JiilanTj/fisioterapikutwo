import 'package:firebase_core/firebase_core.dart';
import 'package:fisioterapiku/components/my_button_two.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisioterapiku/components/my_button.dart';
import 'package:fisioterapiku/components/my_textfield.dart';
import 'package:fisioterapiku/components/square_tile.dart';
import 'package:fisioterapiku/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Error message
  String _errorMessage = '';

  // Success message
  String _successMessage = '';

  // Sign user up method
  void signUserUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        _errorMessage = 'Password tidak cocok';
      });
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Pop the loading circle
      Navigator.pop(context);

      // Simpan data pengguna ke Firestore
      FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'nama': nameController.text, // Simpan nama pengguna
        'email': emailController.text,
        'alamat': null,
        'nomor_hp': null,
      });

      setState(() {
        _successMessage =
            'Daftar berhasil, silahkan masuk di halaman Masuk/Login';
      });
    } on FirebaseAuthException catch (e) {
      // Pop the loading circle
      Navigator.pop(context);

      if (e.code == 'email-already-in-use') {
        setState(() {
          _errorMessage = 'Email sudah digunakan';
        });
      } else if (e.code == 'weak-password') {
        setState(() {
          _errorMessage = 'Password terlalu lemah';
        });
      } else {
        setState(() {
          _errorMessage = 'Terjadi kesalahan. Silakan coba lagi.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 1),

                // Logo
                Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 200,
                ),

                const SizedBox(height: 1),

                // Welcome message
                Text(
                  'Halo, Silahkan mendaftar!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 20),

                // Name textfield
                MyTextField(
                  controller: nameController,
                  hintText: 'Nama',
                  obscureText: false,
                ),

                const SizedBox(height: 5),

                // Email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 5),

                // Password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 5),

                // Confirm password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                // Error message
                if (_errorMessage.isNotEmpty) ...[
                  const SizedBox(height: 5),
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ],

                // Success message
                if (_successMessage.isNotEmpty) ...[
                  const SizedBox(height: 5),
                  Text(
                    _successMessage,
                    style: TextStyle(color: Colors.green),
                  ),
                ],

                const SizedBox(height: 5),

                // Sign up button
                MyButtonTwo(onTap: signUserUp),

                const SizedBox(height: 15),

                // Or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Atau lanjutkan dengan',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Google + Apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // Google button
                    SquareTile(imagePath: 'assets/google.png'),

                    SizedBox(width: 25),

                    // Apple button
                    SquareTile(imagePath: 'assets/apple.png')
                  ],
                ),

                const SizedBox(height: 15),

                // Already have an account? Sign in now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sudah punya akun?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
