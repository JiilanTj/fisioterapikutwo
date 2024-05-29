import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

// Konstanta warna
const kScaffoldColor = Color(0xFFFFFFFF);
const kContentColor = Color(0xFFF5F5F5);
const kPrimaryColor = Color(0xFF1e8492);

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomorHpController = TextEditingController();
  final _alamatController = TextEditingController();

  String? _nama;
  String? _email;
  String? _nomorHp;
  String? _alamat;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        _nama = snapshot['nama'];
        _email = snapshot['email'];
        _nomorHp = snapshot['nomor_hp'];
        _alamat = snapshot['alamat'];
        _nomorHpController.text = _nomorHp ?? '';
        _alamatController.text = _alamat ?? '';
      });
    }
  }

  Future<void> _submitForm() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      bool updated = false;
      if (_nomorHpController.text != _nomorHp ||
          _alamatController.text != _alamat) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'nomor_hp': _nomorHpController.text,
          'alamat': _alamatController.text,
        });
        updated = true;
      }

      final message = '''
Halo, saya ingin konsultasi.
Berikut adalah detail saya:
Nama: $_nama
Email: $_email
Nomor Telepon: ${_nomorHpController.text}
Alamat: ${_alamatController.text}

Terima kasih.
      ''';

      await _sendWhatsAppMessage(message);
    }
  }

  Future<void> _sendWhatsAppMessage(String message) async {
    final url =
        'https://wa.me/6285362166628?text=${Uri.encodeComponent(message)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _nomorHpController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halaman Admin',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _nama == null || _email == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: _buildDetailSection(),
                    ),
                  ),
                  SizedBox(height: 24),
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: _buildUpdateSection(),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(
                      'Hubungi',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 32.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      backgroundColor: kPrimaryColor,
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildDetailSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detail Pengguna',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(height: 16),
        ListTile(
          leading: Icon(Icons.person, color: kPrimaryColor),
          title: Text('Nama'),
          subtitle: Text(_nama!, style: TextStyle(fontSize: 16)),
        ),
        ListTile(
          leading: Icon(Icons.email, color: kPrimaryColor),
          title: Text('Email'),
          subtitle: Text(_email!, style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildUpdateSection() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Update Informasi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _nomorHpController,
            decoration: InputDecoration(
              labelText: 'Nomor Telepon',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: Icon(Icons.phone, color: kPrimaryColor),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Masukkan nomor telepon Anda';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _alamatController,
            decoration: InputDecoration(
              labelText: 'Alamat',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: Icon(Icons.location_on, color: kPrimaryColor),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Masukkan alamat Anda';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
