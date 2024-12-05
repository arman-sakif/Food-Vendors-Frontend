import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  final Map<String, dynamic> foodData;

  FoodPage({required this.foodData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(foodData['foodName']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Food Name and Image
              Text(
                foodData['foodName'],
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.network(
                'https://i0.wp.com/daddioskitchen.com/wp-content/uploads/2023/01/IMG-5299.jpg?resize=800%2C530&ssl=1', // Placeholder image
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              // Food Description
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(foodData['foodDescription']),
              const SizedBox(height: 20),

              // Ingredients & Allergens
              const Text(
                'Ingredients',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(foodData['foodIngredients'].join(', ')),
              const SizedBox(height: 20),

              const Text(
                'Allergens',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(foodData['foodAllergens'].join(', ')),
              const SizedBox(height: 20),

              // Nutritional Info
              const Text(
                'Nutritional Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('Calories: ${foodData['Calorie']} kcal'),
              Text('Protein: ${foodData['proteinPerServing']} g'),
              const SizedBox(height: 20),

              // Price and Availability
              Text(
                'Price: \$${foodData['foodPrice']}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Preparation Time: ${foodData['foodPreparationTime']} min',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Availability: ${foodData['foodAvailability'] ? "Available" : "Not Available"}',
                style: TextStyle(
                    fontSize: 16,
                    color: foodData['foodAvailability']
                        ? Colors.green
                        : Colors.red),
              ),
              const SizedBox(height: 20),

              // Ratings & Reviews
              const Text(
                'Ratings & Reviews',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  Text('${foodData['foodRating']} / 5.0'),
                ],
              ),
              const SizedBox(height: 10),
              ...foodData['foodReviews'].map<Widget>((review) {
                return ListTile(
                  leading: const Icon(Icons.comment),
                  title: Text(review),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
