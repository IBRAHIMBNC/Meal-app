import 'package:flutter/material.dart';

import '../models/Meal.dart';
import '../widgets/Meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> meals;
  const FavouriteScreen({required this.meals});
  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text("There is no favourite meal yet!"),
        ),
      );
    } else {
      return Scaffold(
          body: ListView.builder(
        itemBuilder: (ctx, ind) {
          return MealItem(
            id: meals[ind].id,
            affordability: meals[ind].affordability,
            complexity: meals[ind].complexity,
            duration: meals[ind].duration,
            imageUrl: meals[ind].imageUrl,
            title: meals[ind].title,
          );
        },
        itemCount: meals.length,
      ));
    }
  }
}
