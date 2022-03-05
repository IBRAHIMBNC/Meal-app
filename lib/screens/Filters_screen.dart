import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function btnSaveFunc;
  final Map<String, bool> filterData;

  const FiltersScreen({required this.btnSaveFunc, required this.filterData});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;

  var isVegan = false;

  var isLactoseFree = false;

  var isVegetarian = false;

  @override
  void initState() {
    isGlutenFree = widget.filterData['isGlutenFree']!;
    isVegan = widget.filterData['isVegan']!;
    isLactoseFree = widget.filterData['isLactoseFree']!;
    isVegetarian = widget.filterData['isVegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  Map<String, bool> currentFilValue = {
                    'isGlutenFree': isGlutenFree,
                    'isLactoseFree': isLactoseFree,
                    'isVegan': isVegan,
                    'isVegetarian': isVegetarian
                  };
                  return widget.btnSaveFunc(currentFilValue);
                })
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                'Adjust your meals selection.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten-free'),
                  subtitle: Text('Only include glute-free meals.'),
                  value: isGlutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      isGlutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  subtitle: Text('Only include Vegan meals.'),
                  value: isVegan,
                  onChanged: (newValue) {
                    setState(() {
                      isVegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose-free'),
                  subtitle: Text('Only include Lactose-free meals.'),
                  value: isLactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      isLactoseFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  subtitle: Text('Only include Vegetarian meals.'),
                  value: isVegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      isVegetarian = newValue;
                    });
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
