import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_signup/pages/order_page.dart';
import 'package:login_signup/pages/history_page.dart';
import 'package:login_signup/pages/profile_page.dart';
import 'pizza_menu_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late final AnimationController _controller;

  final List<Pizza> pizzaList = [
    Pizza(
      name: "Mushroom Delight",
      description: "A savory blend of fresh mushrooms, mozzarella cheese, and tender beef",
      price: 167500,
      imagePath: "assets/images/mushroom delight.png",
    ),
    Pizza(
      name: "Margherita",
      description: "Classic cheese and tomato pizza",
      price: 167500,
      imagePath: "assets/images/margherita.png",
    ),
  ];


  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.7,
      upperBound: 1.0,
    )..forward();

    _screens = [
      PizzaMenuPage(),
      OrderPage(pizza: pizzaList[0]),
      HistoryPage(),
      ProfilePage(),
    ];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _controller.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: _buildAnimatedIcon(FontAwesomeIcons.pizzaSlice, 0),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: _buildAnimatedIcon(FontAwesomeIcons.shoppingCart, 1),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: _buildAnimatedIcon(FontAwesomeIcons.history, 2),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: _buildAnimatedIcon(FontAwesomeIcons.user, 3),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return ScaleTransition(
      scale: isSelected ? _controller : _controller.drive(Tween(begin: 1.0, end: 1.0)),
      child: Icon(
        icon,
        size: isSelected ? 30 : 24,
        color: isSelected ? Colors.white : Colors.white70,
        shadows: isSelected
            ? [
          Shadow(
            color: Colors.black45,
            blurRadius: 8,
          ),
        ]
            : [],
      ),
    );
  }
}
