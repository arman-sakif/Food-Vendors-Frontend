import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:try_with_andstudio/restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodVendorsPage(),
    );
  }
}

class FoodVendorsPage extends StatefulWidget {
  @override
  _FoodVendorsPageState createState() => _FoodVendorsPageState();
}

class _FoodVendorsPageState extends State<FoodVendorsPage> {
  final List<String> imgList = [
    'assets/offer1.jpg',
    'assets/offer2.jpg',
    'assets/offer3.jpg',
  ];


  //adding for filtering
  double _currentPriceRange = 100;
  List<String> _selectedDietary = [];
  bool _parkingAvailable = false;
  String _selectedSector = 'Sector 1';

  final List<String> dietaryOptions = ['Halal', 'Vegetarian', 'Vegan', 'Kosher'];
  final List<String> sectors = ['Sector 1', 'Sector 2', 'Sector 3'];
  //--------------------------------------------------------------------

  final List<Map<String, dynamic>> foodVendors = [
    {
      "name": "Pizza Hub",
      "special": "Buy 1 Get 1 Free",
      "image": "assets/pizza.jpg",
      "description": "Best pizzas in town with authentic Italian flavors.",
      "menu": [
        {"item": "Margherita Pizza", "price": 8.99},
        {"item": "Pepperoni Pizza", "price": 9.99},
        {"item": "Veggie Pizza", "price": 7.99},
      ]
    },
    {
      "name": "Green Bowl",
      "special": "20% Off Vegan",
      "image": "assets/salad.jpg",
      "description": "Healthy salads and bowls for a nutritious meal.",
      "menu": [
        {"item": "Caesar Salad", "price": 6.99},
        {"item": "Quinoa Bowl", "price": 7.99},
        {"item": "Fruit Salad", "price": 5.99},
      ]
    },
    {
      "name": "Biryani House",
      "special": "Halal Biryani Special",
      "image": "assets/biryani.jpg",
      "description": "Authentic Hyderabadi biryani and Indian cuisine.",
      "menu": [
        {"item": "Chicken Biryani", "price": 10.99},
        {"item": "Mutton Biryani", "price": 12.99},
        {"item": "Veg Biryani", "price": 8.99},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Search Food Vendors...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white54),
            prefixIcon: Icon(Icons.search, color: Colors.white),
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: (value) {
            // Search functionality will go here
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Profile functionality
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Filter Options', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            // Price filter
            ListTile(
              title: const Text('Price Range'),
              subtitle: Slider(
                value: _currentPriceRange,
                min: 0,
                max: 500,
                divisions: 10,
                label: '\$${_currentPriceRange.round()}',
                onChanged: (value) {
                  setState(() {
                    _currentPriceRange = value;
                  });
                },
              ),
            ),
            // Dietary choices filter
            ExpansionTile(
              title: const Text('Dietary Options'),
              children: dietaryOptions.map((diet) {
                return CheckboxListTile(
                  title: Text(diet),
                  value: _selectedDietary.contains(diet),
                  onChanged: (bool? selected) {
                    setState(() {
                      if (selected!) {
                        _selectedDietary.add(diet);
                      } else {
                        _selectedDietary.remove(diet);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            // Parking availability filter
            ListTile(
              leading: Checkbox(
                value: _parkingAvailable,
                onChanged: (bool? value) {
                  setState(() {
                    _parkingAvailable = value!;
                  });
                },
              ),
              title: const Text('Parking Available'),
            ),
            // Sector filter
            ListTile(
              title: const Text('Location Sector'),
              subtitle: DropdownButton<String>(
                value: _selectedSector,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSector = newValue!;
                  });
                },
                items: sectors.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Advertising canvas (carousel slider)
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: imgList.map((item) => Container(
                child: Center(
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                ),
              )).toList(),
            ),
            // Display list of food vendors
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Food Vendors',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: foodVendors.map((vendor) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Image.asset(
                            vendor['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(vendor['name']),
                          subtitle: Text(vendor['special']),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestaurantPage(
                                  vendor: vendor,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
