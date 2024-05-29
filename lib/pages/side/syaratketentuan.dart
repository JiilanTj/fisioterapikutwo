import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SyaratPage extends StatelessWidget {
  const SyaratPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Syarat Ketentuan',
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
                'Syarat dan Ketentuan',
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
                label: 'Pendaftaran dan Akun:',
                text: '''
- Pengguna wajib mendaftar dan membuat akun dengan informasi yang benar.
- Pengguna bertanggung jawab atas keamanan akunnya.''',
              ),
              StyledTextDropdown(
                label: 'Transaksi:',
                text: '''
- Pengguna dapat melakukan berbagai macam transaksi melalui Aplikasi.
- Pengguna bertanggung jawab atas informasi Transaksi yang dimasukkan.
- Biaya Transaksi akan ditampilkan sebelum Transaksi dilakukan.''',
              ),
              StyledTextDropdown(
                label: 'Pengembalian Uang:',
                text: '''
- Pengembalian uang hanya dapat dilakukan jika terdapat kesalahan pada Transaksi.
- Pengguna harus mengajukan permintaan pengembalian uang melalui Aplikasi.''',
              ),
              StyledTextDropdown(
                label: 'Privasi:',
                text: '''
- Meynta akan melindungi privasi Pengguna sesuai dengan Kebijakan Privasi yang berlaku.''',
              ),
              StyledTextDropdown(
                label: 'Ganti Rugi:',
                text: '''
- Pengguna setuju untuk mengganti rugi Meynta atas segala kerugian yang disebabkan oleh pelanggaran terhadap Syarat dan Ketentuan ini.''',
              ),
              StyledTextDropdown(
                label: 'Penyelesaian Sengketa:',
                text: '''
- Sengketa akan diselesaikan melalui musyawarah mufakat.
- Jika musyawarah mufakat tidak tercapai, maka sengketa akan diselesaikan melalui pengadilan yang berwenang.''',
              ),
              StyledTextDropdown(
                label: 'Ketentuan Lainnya:',
                text: '''
- Meynta berhak untuk mengubah Syarat dan Ketentuan ini.
- Pengguna diwajibkan untuk membaca dan memahami Syarat dan Ketentuan ini.''',
              ),
              StyledTextDropdown(
                label: 'Hubungi Kami:',
                text: '''
- Jika Pengguna memiliki pertanyaan atau keluhan, silakan hubungi Meynta melalui email meyntaiketut@gmail.com''',
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
