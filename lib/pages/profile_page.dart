import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'side/saya.dart';
import 'side/keamanan.dart';
import 'side/pusatbantuan.dart';
import 'side/syaratketentuan.dart';
import 'side/kebijakanprivasi.dart';
import 'package:fisioterapiku/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentSlide = 1;
    return FutureBuilder(
      future: _getUserData(),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child:
                  CircularProgressIndicator()); // Tampilkan indikator loading jika data belum tersedia
        } else if (snapshot.hasError) {
          return Center(
              child: Text(
                  'Error: ${snapshot.error}')); // Tampilkan pesan error jika terjadi kesalahan
        } else {
          final userData = snapshot.data!;
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 80), // Memberikan jarak dari atas
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20), // Memberikan jarak horizontal
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor:
                          Colors.blue, // Warna latar belakang lingkaran avatar
                      child: Text(
                        userData['name'][0]
                            .toUpperCase(), // Mengambil huruf pertama dari nama pengguna dan mengonversikannya ke huruf besar
                        style: TextStyle(
                          fontSize: 75, // Ukuran teks
                          fontWeight: FontWeight.bold, // Ketebalan teks
                          color: Colors.white, // Warna teks
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    userData['name'], // Tampilkan nama pengguna
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userData['email'], // Tampilkan email pengguna
                  ),
                  SizedBox(height: 32),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile saya'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SayaPage()), // Ganti SayaPage dengan nama halaman yang benar
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.security),
                    title: Text('Keamanan'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AmanPage()), // Ganti AmanPage dengan nama halaman yang benar
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Pusat Bantuan'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PusatBantuanPage()), // Ganti PusatBantuanPage dengan nama halaman yang benar
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.description),
                    title: Text('Syarat & Ketentuan'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SyaratPage()), // Ganti SyaratPage dengan nama halaman yang benar
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip),
                    title: Text('Kebijakan Privasi'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                KebijakanprivasiPage()), // Ganti KebijakanprivasiPage dengan nama halaman yang benar
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginPage()), // Ganti KebijakanprivasiPage dengan nama halaman yang benar
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  // Fungsi untuk mengambil data pengguna dari Firestore
  Future<Map<String, dynamic>> _getUserData() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;

    if (user != null) {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid) // Menggunakan UID pengguna yang sedang login
              .get();

      // Ambil nilai field "name" dan "email" dari Firestore
      final userData = {
        'name': snapshot['nama'],
        'email': snapshot['email'],
      };

      return userData;
    } else {
      throw 'User is not signed in';
    }
  }
}
