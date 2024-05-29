import 'package:flutter/material.dart';
import 'package:fisioterapiku/constants.dart';
import 'package:fisioterapiku/widgets/categories.dart';
import 'package:fisioterapiku/widgets/home_appbar.dart';
import 'package:fisioterapiku/widgets/home_slider.dart';
import 'package:fisioterapiku/widgets/search_fields.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSlide = 0;

  @override
  void initState() {
    super.initState();
  }

  String getGreetingByTime() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 3 && hour < 12) {
      return 'Pagi';
    } else if (hour >= 12 && hour < 15) {
      return 'Siang';
    } else if (hour >= 15 && hour < 18) {
      return 'Sore';
    } else {
      return 'Malam';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              SizedBox(height: 20),
              SearchField(),
              SizedBox(height: 20),
              HomeSlider(
                onChange: (value) {
                  setState(() {
                    currentSlide = value;
                  });
                },
                currentSlide: currentSlide,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Categories(),
              ),
              SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Hubungi Admin sebelum memesan',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pilih kategori",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Selamat ${getGreetingByTime()}"),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 200, // Atur tinggi sesuai kebutuhan
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                'assets/dewasa.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Dewasa',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Card(
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                'assets/anak.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Anak-anak',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
