import 'package:flutter/material.dart';

import '../models/Meal.dart';
import '../widgets/Meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meal';
  List<Meal> availableMeal;

  CategoryMealScreen({required this.availableMeal});
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final String _categoryTitle = routeData['title'] as String;
    final _categoryId = routeData['id'] as String;
    final categoryMeals = availableMeal.where((element) {
      return element.categories.contains(_categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(_categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, ind) {
            return MealItem(
              id: categoryMeals[ind].id,
              affordability: categoryMeals[ind].affordability,
              complexity: categoryMeals[ind].complexity,
              duration: categoryMeals[ind].duration,
              imageUrl: categoryMeals[ind].imageUrl,
              title: categoryMeals[ind].title,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
