import 'package:babies/drawer.dart';
import 'package:babies/screen/carusel.dart';
import 'package:flutter/material.dart';
import 'package:babies/screen/cart.dart';
import 'package:babies/screen/signup.dart';
import 'package:babies/screen/signin.dart';
import 'package:babies/drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Baby Shop',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> images = [
    'https://target.scene7.com/is/image/Target/shoes-211215-1639605768116',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=5',
    'https://picsum.photos/250?image=12',
    'https://picsum.photos/250?image=15',
    'https://picsum.photos/250?image=17',
  ];
  int _selectedIndex = 0; // Define the variable here

  void _onItemTapped(int index) { // Define the function here
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Baby Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));

              // Handle cart button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Handle profile button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    child: Text('Shoes'),
                    onPressed: () {
                      // handle shoes button press
                    },
                  ),
                  ElevatedButton(
                    child: Text('Toys'),
                    onPressed: () {
                      // handle toys button press
                    },
                  ),
                  ElevatedButton(
                    child: Text('Health'),
                    onPressed: () {
                      // handle health button press
                    },
                  ),
                  ElevatedButton(
                    child: Text('Strollers'),
                    onPressed: () {
                      // handle strollers button press
                    },
                  ),
                  ElevatedButton(
                    child: Text('Clothes'),
                    onPressed: () {
                      // handle clothes button press
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            GoodsCarousel(images: images),

            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://target.scene7.com/is/image/Target/shoes-211215-1639605768116',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Product Name',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                'Product Description',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),

                              const SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '\$10.00',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    child: const Text('Add to cart'),
                                    onPressed: () {
                                      // Handle add to cart button press
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: getNavbar(context),
    );
  }
  Widget getNavbar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Catalogue',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorite',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Colors.blue,
        ),
      ],
    );
  }
}