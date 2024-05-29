import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PusatBantuanPage extends StatelessWidget {
  const PusatBantuanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pusat Bantuan',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF27668F),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bila anda membutuhkan Bantuan dan memiliki Pertanyaan, silahkan hubungi meyntaiketut@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
