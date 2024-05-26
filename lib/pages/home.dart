import 'package:flutter/material.dart';
import 'package:fisioterapiku/constants.dart';
import 'package:fisioterapiku/models/product.dart';
import 'package:fisioterapiku/widgets/categories.dart';
import 'package:fisioterapiku/widgets/home_appbar.dart';
import 'package:fisioterapiku/widgets/home_slider.dart';
import 'package:fisioterapiku/widgets/product_card.dart';
import 'package:fisioterapiku/widgets/search_fields.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSlide = 0;
  String userCity = '';
  List<Product> productsList = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> loadProductsByLocation(String location) async {
    ProductRepository productRepository = ProductRepository();
    List<Product> products =
        await productRepository.getProductsByLocation(location);
    setState(() {
      productsList = products;
    });
  }

  void onCitySubmitted(String city) {
    setState(() {
      userCity = city;
      loadProductsByLocation(city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                const SizedBox(height: 20),
                SearchField(onSubmitted: onCitySubmitted),
                const SizedBox(height: 20),
                HomeSlider(
                  onChange: (value) {
                    setState(() {
                      currentSlide = value;
                    });
                  },
                  currentSlide: currentSlide,
                ),
                const SizedBox(height: 20),
                const Categories(),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Paket dikota Anda, $userCity",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("See all"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: productsList.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: productsList[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
