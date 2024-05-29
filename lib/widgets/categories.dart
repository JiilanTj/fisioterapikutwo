import 'package:flutter/material.dart';
import 'package:fisioterapiku/constants.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final titles = ["Dewasa", "Anak-anak"];

    return Center(
      child: Center(
        child: SizedBox(
          height: 50, // Tinggi listview yang sesuai dengan tinggi tombol
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 100,
                height: 20,
                child: ElevatedButton(
                  onPressed: () {
                    if (index == 0) {
                      // Aksi untuk tombol "Dewasa"
                      print("Dewasa button pressed");
                    } else if (index == 1) {
                      // Aksi untuk tombol "Anak-anak"
                      print("Anak-anak button pressed");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        kprimaryColor, // Warna latar belakang tombol
                    foregroundColor: Colors.white, // Warna teks tombol
                    padding:
                        const EdgeInsets.all(0), // Hilangkan padding default
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      titles[index],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemCount: titles.length,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: kscaffoldColor,
      body: Categories(),
    ),
  ));
}
