// buy_dialog.dart
import 'package:flutter/material.dart';
import 'cart.dart';
import 'product.dart';

class BuyDialog extends StatelessWidget {
  final Cart _cart;
  const BuyDialog(this._cart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Выберите способ оплаты'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<String>(
            items: const [
              DropdownMenuItem(value: 'card', child: Text('Банковская карта')),
              DropdownMenuItem(value: 'bonus', child: Text('Бонусы Спасибо')),
              DropdownMenuItem(value: 'spb', child: Text('СПБ')),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _cart.products.map<Widget>(
                (Product product) {
                  return Column(
                    children: [
                      Text(product.name),
                      Text('\$${product.price}'),
                    ],
                  );
                },
              ).toList(),
            ),
          ),
          const SizedBox(height: 16),
          Text('Общая сумма: \$${_cart.totalAmount}'),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            _cart.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Покупка успешно оформлена!')),
            );
          },
          child: const Text('Оплатить'),
        ),
      ],
    );
  }
}