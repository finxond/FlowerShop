// product_item.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled55412/cart.dart';

import 'BuyNowButton.dart';
import 'product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Cart cart;

  const ProductItem({Key? key, required this.product, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: product.images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Image.network(
                  product.images[index] as String,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 16.0,
                color: Color.fromARGB(255, 115, 97, 233),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.characteristics
                  .map((characteristic) => Text(
                        characteristic,
                        style: const TextStyle(fontSize: 14.0),
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Отзывы: '),
                for (final review in product.reviews) ...[
                  Text(
                    review,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ],
            ),
          ),
          Positioned(
          bottom: 8.0,
          right: 8.0,
          child: AddToCartButton(
            product: product,
            onAddToCart: () {
            if (kDebugMode) {
             print("Adding ${product.name} to the cart");
             }
           },
           )
        ),
        Positioned(
        bottom: 8.0,
        right: 8.0,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Expanded(
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
               children: [
            AddToCartButton(
              product: product,
              onAddToCart: () {
                if (kDebugMode) {
                  print("Adding ${product.name} to the cart");
                }
              },
            ),
            const SizedBox(width: 8.0),
            BuyNowButton(
              product: product,
              cart: Cart()  // You need to pass the `cart` object here
            ),
          ],
        ),
      ),
    ],
  ),
),
        ],
        
      ),
    );
  }
}


class AddToCartButton extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const AddToCartButton({
    Key? key,
    required this.product,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onAddToCart,
      child: const Text('Добавить в корзину'),
    );
  }
}