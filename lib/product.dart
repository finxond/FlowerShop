import 'package:flutter/material.dart';

class Product {
  final String name;
  final List<Image> images;
  final double price;
  final String description;
  final List<String> characteristics;
  final List<String> reviews;
  late double rating;
@override
  String toString();
  Product(
    this.name,
    this.images,
    this.price, {
    required this.description,
    required this.characteristics,
    required this.reviews,
    double rating = 0.0,
  }) {
    this.rating = calculateRating();
  }

  double calculateRating() {
    double rating = 0.0;

    if (reviews.isNotEmpty) {
      double sum = 0.0;
      for (String review in reviews) {
        sum += double.parse(review);
      }
      rating = sum / reviews.length;
    }

    return rating;
  }

  void addReview(String review) {
    reviews.add(review);
    rating = calculateRating();
  }
}