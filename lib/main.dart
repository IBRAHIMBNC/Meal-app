import 'package:flutter/material.dart';
import 'package:meal_app/screens/Category_Meal_Screen.dart';
import 'package:meal_app/screens/Filters_screen.dart';
import 'package:meal_app/screens/Meal_Details_Screen.dart';
import 'package:meal_app/screens/Tabs_Screen.dart';

import 'dummy_data.dart';
import 'models/Meal.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favourite = [];

  Map<String, bool> _filter = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false
  };

  bool isFavourite(String id) {
    return _favourite.any((element) => element.id == id);
  }

  void _toggleFavourite(String mealId) {
    final index = _favourite.indexWhere((meal) => meal.id == mealId);
    if (index >= 0)
      setState(() {
        _favourite.removeAt(index);
      });
    else
      setState(() {
        _favourite
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
  }

  void _setFilters(Map<String, bool> fil) {
    setState(() {
      _filter = fil;
      _availableMeal = DUMMY_MEALS.where((element) {
        if (element.isGlutenFree && fil['isGlutenFree']!) return true;
        if (element.isVegan && fil['isVegan']!) return true;
        if (element.isVegetarian && fil['isVegetarian']!) return true;
        if (element.isLactoseFree && fil['isLactoseFree']!) return true;
        return false;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Color.fromRGBO(218, 165, 32, 1)),
      ),
      routes: {
        '/': (ctx) => TabsScreen(
              favourite: _favourite,
            ),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(
              availableMeal: _availableMeal,
            ),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(
              toggleFunc: _toggleFavourite,
              isFavo: isFavourite,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              btnSaveFunc: _setFilters,
              filterData: _filter,
            ),
      },
    );
  }
}
