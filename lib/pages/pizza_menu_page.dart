import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'order_page.dart';

class Pizza {
  final String name;
  final String description;
  final int price;
  final String imagePath;

  Pizza({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

class PizzaMenuPage extends StatelessWidget {
  final List<Pizza> pizzaList = [
    Pizza(
      name: "Mushroom Delight",
      description: "A savory blend of fresh mushrooms, mozzarella cheese, and tender beef",
      price: 150000,
      imagePath: "assets/images/mushroom delight.png",
    ),
    Pizza(
      name: "Margherita",
      description: "Classic cheese and tomato pizza",
      price: 150000,
      imagePath: "assets/images/margherita.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 90),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            height: 50, // Tinggi kapsul
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25), // Radius besar untuk bentuk kapsul
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 4), // Shadow untuk efek 3D
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for pizza...",
                prefixIcon: Icon(Icons.search, color: Colors.orangeAccent),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25), // Border kapsul di TextField
                  borderSide: BorderSide.none, // Menghilangkan border
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                hintStyle: TextStyle(color: Colors.grey[500]),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: pizzaList.length,
            itemBuilder: (context, index) {
              final pizza = pizzaList[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white60,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              pizza.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        pizza.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        pizza.description,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rp${NumberFormat('#,###', 'id_ID').format(pizza.price)}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(12),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderPage(pizza: pizza),
                                ),
                              );
                            },
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
