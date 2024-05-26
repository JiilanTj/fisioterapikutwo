class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  Category(title: "Medan", image: "assets/shoes.jpg"),
  Category(title: "Bandung", image: "assets/beauty.png"),
  Category(title: "Jakarta", image: "assets/pc.jpg"),
  Category(title: "Surabaya", image: "assets/mobile.jpg"),
  Category(title: "Yogakarta", image: "assets/watch.png"),
];
