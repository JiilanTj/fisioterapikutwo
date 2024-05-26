import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final String price;
  final String kota;
  final double rate;
  final int pertemuan;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.kota,
    required this.rate,
    required this.pertemuan,
  });

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Product(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
      price: data['price'] ?? '',
      kota: data['kota'] ?? '',
      rate: (data['rate'] ?? 0).toDouble(),
      pertemuan: data['pertemuan'] ?? 0,
    );
  }
}

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> getProductsByLocation(String location) async {
    QuerySnapshot snapshot = await _firestore
        .collection('products')
        .where('kota', isEqualTo: location)
        .get();

    return snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
  }
}
