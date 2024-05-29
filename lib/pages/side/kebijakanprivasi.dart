import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KebijakanprivasiPage extends StatelessWidget {
  const KebijakanprivasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kebijakan Privasi',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Kebijakan Privasi',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF27668F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20),
              StyledTextDropdown(
                label: 'Informasi yang Kami Kumpulkan:',
                text: '''
- Informasi yang Anda berikan saat mendaftar akun, seperti nama, alamat email, dan nomor telepon.
- Informasi tentang Transaksi yang Anda lakukan melalui Aplikasi.''',
              ),
              StyledTextDropdown(
                label: 'Penggunaan Informasi:',
                text: '''
- Kami menggunakan informasi Anda untuk menyediakan layanan Aplikasi kepada Anda.
- Kami juga menggunakan informasi Anda untuk meningkatkan layanan kami, mencegah penipuan, dan melindungi keamanan Anda.''',
              ),
              StyledTextDropdown(
                label: 'Pembagian Informasi:',
                text: '''
- Kami tidak akan membagikan informasi pribadi Anda dengan pihak ketiga tanpa persetujuan Anda.
- Kami dapat membagikan informasi agregat atau anonim dengan pihak ketiga untuk tujuan penelitian atau statistik.''',
              ),
              StyledTextDropdown(
                label: 'Keamanan:',
                text: '''
- Kami menggunakan langkah-langkah keamanan yang wajar untuk melindungi informasi Anda dari akses yang tidak sah, pengungkapan, penggunaan, atau pengubahan.''',
              ),
              StyledTextDropdown(
                label: 'Hak Anda:',
                text: '''
- Anda memiliki hak untuk mengakses, memperbaiki, dan menghapus informasi pribadi Anda.
- Anda juga memiliki hak untuk membatasi penggunaan informasi Anda dan untuk mengajukan keberatan terhadap pemrosesan informasi Anda.''',
              ),
              StyledTextDropdown(
                label: 'Perubahan Kebijakan Privasi:',
                text: '''
- Kami dapat mengubah Kebijakan Privasi ini dari waktu ke waktu.
- Kami akan memberitahukan Anda tentang perubahan apa pun melalui email atau melalui Aplikasi.''',
              ),
              StyledTextDropdown(
                label: 'Hubungi Kami:',
                text: '''
- Jika Pengguna memiliki pertanyaan atau keluhan, silakan hubungi Kami melalui email meyntaiketut@gmail.com''',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StyledTextDropdown extends StatefulWidget {
  final String label;
  final String text;

  const StyledTextDropdown({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  @override
  _StyledTextDropdownState createState() => _StyledTextDropdownState();
}

class _StyledTextDropdownState extends State<StyledTextDropdown> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isOpened = !isOpened;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF27668F),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  isOpened ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Color(0xFF27668F),
                ),
              ],
            ),
          ),
        ),
        if (isOpened)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.text,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF444444),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
