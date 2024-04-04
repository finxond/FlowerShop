// product_details_screen.dart

import 'package:flutter/material.dart';

import '../product.dart';
import 'add_review_dialog.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.network(widget.product.images as String),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              widget.product.description,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: widget.product.characteristics
                  .map(
                    (characteristic) => Text(
                      characteristic,
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Отзывы',style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Рейтинг: ${widget.product.rating.toStringAsFixed(1)}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: widget.product.reviews
                  .map(
                    (review) => Text(
                      review,
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add to cart functionality
                  },
                  child: const Text('Добавить в корзину'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AddReviewDialog(product: widget.product);
                      },
                    );
                  },
                  child: const Text('Оставить отзыв'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}