import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:onlineshopapp/screen/account_screen.dart';
import 'package:onlineshopapp/screen/cart_screen.dart';
import 'package:onlineshopapp/screen/categoryscreen.dart';
import 'package:onlineshopapp/screen/homescreen.dart';
import 'package:onlineshopapp/screen/message_screen.dart';
import 'package:onlineshopapp/screen/spleshscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    MessageScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 0 ? Icons.home_outlined : Icons.home),
            label: 'Home',
            //backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 1 ? Icons.category : Icons.category_outlined),
            label: 'Category',
            //backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon:
                Icon(_selectedIndex == 2 ? IconlyBold.chat : IconlyLight.chat),
            label: 'Message',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3 ? IconlyBold.buy : IconlyLight.buy),
            label: 'Cart',
            //backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 4
                ? CupertinoIcons.person_solid
                : CupertinoIcons.person),
            label: 'Account',
            // backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
