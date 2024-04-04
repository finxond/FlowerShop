// add_review_dialog.dart

import 'package:flutter/material.dart';

import '../product.dart';

class AddReviewDialog extends StatefulWidget {
  final Product product;

  const AddReviewDialog({Key? key, required this.product}) : super(key: key);

  @override
  _AddReviewDialogState createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  final TextEditingController _ratingController = TextEditingController(text: '0');
  final _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Отзыв'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _ratingController,
            decoration: const InputDecoration(
              labelText: 'Оценка* (1-5)',
            ),
          ),
          TextField(
            controller: _reviewController,
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Опишите свои впечатления после покупки*',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Назад'),
        ),
        TextButton(
          onPressed: () {
            if (_ratingController.text.isNotEmpty &&
                _reviewController.text.isNotEmpty &&
                int.tryParse(_ratingController.text) != null &&
                int.parse(_ratingController.text) <= 5) {
              setState(() {
                widget.product.reviews.add(_reviewController.text);
                widget.product.rating =
                    (widget.product.rating * widget.product.reviews.length +
                            double.parse(_ratingController.text)) /
                        (widget.product.reviews.length +1);
              });

              Navigator.pop(context);
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}