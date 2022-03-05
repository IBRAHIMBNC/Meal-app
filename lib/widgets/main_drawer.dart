import 'package:flutter/material.dart';

import '../screens/Filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(IconData icon, String title, Function handler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: () => handler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 150,
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          _buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed(('/'));
          }),
          _buildListTile(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
