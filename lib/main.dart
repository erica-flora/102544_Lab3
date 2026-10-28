import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const RestaurantMenuPage(),
    );
  }
}

class RestaurantMenuPage extends StatelessWidget {
  const RestaurantMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Restaurant Menu'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            FoodCard(
              foodName: 'Special Fried Chicken Set',
              price: 'RM 18.90',
              description:
              'Homemade recipe fried chicken with fries and soft drinks on the side.',
              icon: Icons.egg_alt,
              color: Colors.deepOrange,
            ),

            const SizedBox(height: 15),

            FoodCard(
              foodName: 'Chicken Burger Set',
              price: 'RM 15.90',
              description:
              'Juicy grilled real chicken patty with lettuce and cheese and soft drinks on the side.',
              icon: Icons.lunch_dining,
              color: Colors.blue,
            ),

            const SizedBox(height: 15),

            FoodCard(
              foodName: 'Hawaii to Malaysia Chicken Pizza',
              price: 'RM 22.90',
              description:
              'A 16 inch pizza with pineapple and chicken on the top with rendang sauce.',
              icon: Icons.local_pizza,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String foodName;
  final String price;
  final String description;
  final IconData icon;
  final Color color;

  const FoodCard({
    super.key,
    required this.foodName,
    required this.price,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: ListTile(
        tileColor: color,
        leading: Icon(
          icon,
          color: Colors.black,
          size: 45,
        ),
        title: Text(
          foodName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          price,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailPage(
                foodName: foodName,
                price: price,
                description: description,
                icon: icon,
              ),
            ),
          );
        },
      ),
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  final String foodName;
  final String price;
  final String description;
  final IconData icon;

  const FoodDetailPage({
    super.key,
    required this.foodName,
    required this.price,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 100,
                    color: Colors.deepOrange,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    foodName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}