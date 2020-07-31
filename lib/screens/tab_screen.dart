import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  final List<Map<String, Object>> _screens = [
    {'title': 'Categoria', 'Screen': CategoryScreen()},
    {'title': 'Favoritos', 'Screen': FavoriteScreen()},
  ];

_selectedScreen(int index) {
setState(() {
  _selectedIndex = index;
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categorias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favoritos'),
          ),
        ],
      ),
    );
  }
}
