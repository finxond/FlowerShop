import 'package:flutter/material.dart';
import 'package:untitled55412/product.dart';
import 'registration.dart';
import 'package:untitled55412/product_item.dart';
import 'product_detail_screen.dart';
import 'cart.dart';



class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Product> _products = [
    Product(
     'Cortaderia',
     [Image.asset('Images/Cortaderia/1.png'), 
     Image.asset('Images/Cortaderia/2.png'), 
     Image.asset('Images/Cortaderia/3.png'), 
     Image.asset('Images/Cortaderia/4.png'), 
     Image.asset('Images/Cortaderia/5.png'), 
     Image.asset('Images/Cortaderia/6.png'), 
     Image.asset('Images/Cortaderia/7.png')],
     6.11,
      description: 'Dry Decorative Grass, 65 cm, 300 g, 15 pcs',
     characteristics: ['Type - Dry Decorative Grass', 'Pieces in one product - 15', 'Flower type - Cortaderia', 'Height, cm - 65', 'Weight, g - 300'],
      reviews: [],
      rating: 3.0,
   ),
    Product(
      'Букет из лавандовой Гортензии 5 шт.',
      [Image.asset('Images/bouqetLavanda/1bl.png'),
       Image.asset('Images/bouqetLavanda/2bl.png'), 
       Image.asset('Images/bouqetLavanda/3bl.png')],
      25.99,
      description: 'Прекрасный дизайнерский моно букет в современном исполнении из свежих срезанных цветов обрадует любого получателя. Наши флористы вкладывают душу в каждый букет.',
      characteristics: [
      'Тип - Букет', 
      'Состав - Гортензия лавандовая - 5 шт, упаковка дизайнерская', 
      'Вид цветов - Гортензия', 
      'Оформление - Оберточная бумага, пленка под ленту',
      'Высота - 45 см'
        ],
    reviews: [],
    rating: 3.0,
  ),
   Product('Композиция из хлопка, пшеницы и лаванды ',
    [Image.asset('Images/CompositionLavandaHlopok/1ClH.png'),
    Image.asset('Images/CompositionLavandaHlopok/2ClH.png'), 
    Image.asset('Images/CompositionLavandaHlopok/3ClH.png'),
    Image.asset('Images/CompositionLavandaHlopok/4ClH.png'),
    Image.asset('Images/CompositionLavandaHlopok/5ClH.png'),
    Image.asset('Images/CompositionLavandaHlopok/6ClH.png')], 
   1634, 
    description: 'Композиция из хлопка, пшеницы и лаванды – это стильный и элегантный подарок, который станет прекрасным дополнением к любому торжеству или событию. ', 
   characteristics: [  
     'Тип - монобукет',
     'Вид цветов - лаванда, пшеница, хлопок',
     'Количеств цветов - 17 шт.',
     'Высота букета - 50 см.'
           ],
    reviews: [],
   rating: 3.0, ),
   Product('Букет живых цветов из гортензий',
    [Image.asset('Images/LifesFlowers/1LF.png'), 
    Image.asset('Images/LifesFlowers/2LF.png'),
    Image.asset('Images/LifesFlowers/3LF.png'),
    Image.asset('Images/LifesFlowers/4LF.png'),
    Image.asset('Images/LifesFlowers/5LF.png')], 
    2144,
     description: 'Авторский букет из гортензии – оригинальный подарок маме, подруге, сестре, коллеге, бабушке, любимой, который поднимет настроение и очарует своей нежностью.', 
     characteristics: [
      'Высота, см - 45',
      'Ширина, см - 35',
      'Вес товара, г - 500',
      'Сорт цветов - Гортензия',
      'Количество цветов, шт - 5',
      'Цвет - Разноцветный'
     ], 
     reviews: [],
     rating: 3.0)
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flower Shop'),
        actions: [
        Align(
            alignment: const Alignment(0.6,0.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
              ),
              onPressed: () {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const FirstScreen()),
                );
              },
              child: const Text('Авторизоваться'),
            )
          )
        ],
      ),
      body: 
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.7,
        ),
        itemCount: _products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: _products[index]),
                ),
              );
            },
            child: ProductItem(product: _products[index], cart: Cart(),),
          );
        },
      ),
    );
  }
}