
import 'package:flutter/material.dart';

import 'cart.dart';
import 'product.dart';
import 'buy_dialog.dart';

class BuyNowButton extends StatelessWidget {
  final Product product;
  final Cart cart;

  const BuyNowButton({
    Key? key,
    required this.product,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        cart.addProduct(product);
        showDialog(
          context: context,
          builder: (_) => BuyDialog(cart),
        );
      },
      child: const Text('Купить сразу'),
    );
  }
}