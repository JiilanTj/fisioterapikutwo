import 'package:firebase_core/firebase_core.dart';
import 'package:fisioterapiku/components/my_button_two.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisioterapiku/components/my_button.dart';
import 'package:fisioterapiku/components/my_textfield.dart';
import 'package:fisioterapiku/components/square_tile.dart';
import 'package:fisioterapiku/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // error message
  String _errorMessage = '';

  // success message
  String _successMessage = '';

  // sign user up method
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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
      setState(() {
        _successMessage =
            'Daftar berhasil, silahkan masuk di halaman Masuk/Login';
      });
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
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

                // logo
                Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 200,
                ),

                const SizedBox(height: 1),

                // welcome back, you've been missed!
                Text(
                  'Halo, Silahkan mendaftar!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 20),

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 5),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 5),

                // confirm password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                // error message
                if (_errorMessage.isNotEmpty) ...[
                  const SizedBox(height: 5),
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ],

                // success message
                if (_successMessage.isNotEmpty) ...[
                  const SizedBox(height: 5),
                  Text(
                    _successMessage,
                    style: TextStyle(color: Colors.green),
                  ),
                ],

                const SizedBox(height: 5),

                // sign up button
                MyButtonTwo(onTap: signUserUp),

                const SizedBox(height: 15),

                // or continue with
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

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'assets/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'assets/apple.png')
                  ],
                ),

                const SizedBox(height: 15),

                // not a member? sign in now
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
