import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/Meal.dart';
import '../widgets/main_drawer.dart';
import 'Category_screen.dart';
import 'Favourites_Screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favourite;

  TabsScreen({required this.favourite});
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _selectedIndex;
  int index = 0;
  @override
  void initState() {
    _selectedIndex = [
      {'title': 'Categories', 'widget': CategoryScreen()},
      {
        'title': 'Favourites',
        'widget': FavouriteScreen(
          meals: widget.favourite,
        )
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_selectedIndex[index]['title'].toString()),
      ),
      body: _selectedIndex[index]['widget'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (ind) {
          setState(() {
            index = ind;
          });
        },
        currentIndex: index,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.category),
              label: _selectedIndex[0]['title'].toString()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              label: _selectedIndex[1]['title'].toString()),
        ],
      ),
    );
  }
}
