import 'package:flutter/material.dart';

class Goods {
  final String name;
  final String description;
  final double price;
  final String image;

  Goods({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Goods> _items = [    Goods(      name: 'Product 1',      description: 'This is the description of product 1',      price: 9.99,      image: 'https://target.scene7.com/is/image/Target/shoes-211215-1639605768116',    ),    Goods(      name: 'Product 2',      description: 'This is the description of product 2',      price: 19.99,      image: 'https://target.scene7.com/is/image/Target/shoes-211215-1639605768116',    ),    Goods(      name: 'Product 3',      description: 'This is the description of product 3',      price: 29.99,      image: 'https://target.scene7.com/is/image/Target/shoes-211215-1639605768116',    ),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: _buildCart(),
    );
  }

  Widget _buildCart() {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                _items[index].image,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _items[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      _items[index].description,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '\$${_items[index].price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _items.removeAt(index);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
