class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  Category(title: "Dewasa", image: "assets/shoes.jpg"),
  Category(title: "Anak-anak", image: "assets/beauty.png"),
];
