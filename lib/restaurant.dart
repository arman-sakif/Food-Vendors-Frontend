import 'package:flutter/material.dart';
import 'package:try_with_andstudio/food.dart';

class RestaurantPage extends StatelessWidget {
  final Map<String, dynamic> vendor;

  RestaurantPage({required this.vendor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(vendor['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant Banner Image
            Image.asset(
              vendor['image'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Restaurant Name and Description
                  Text(
                    vendor['name'],
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    vendor['description'],
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20),

                  // Menu Section
                  const Text(
                    'Menu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  ...vendor['menu'].map<Widget>((item) {
                    return ListTile(
                      title: Text(item['item']),
                      trailing: Text('\$${item['price']}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodPage(
                              foodData: {
                                "foodID": 1,
                                "foodName": item['item'],
                                "foodIngredients": ['Tomato', 'Cheese', 'Basil'],
                                "foodAllergens": ['Dairy'],
                                "foodDescription": "A delicious blend of fresh ingredients on a crispy crust.",
                                "foodPrice": item['price'],
                                "foodCategory": 'Pizza',
                                "foodPreparationTime": 15,
                                "foodAvailability": true,
                                "foodRating": 4.5,
                                "foodReviews": ['Amazing taste!', 'Will order again.'],
                                "Calorie": 250.0,
                                "proteinPerServing": 8.0
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

