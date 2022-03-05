import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function toggleFunc;
  final Function isFavo;
  const MealDetailsScreen({required this.toggleFunc, required this.isFavo});

  Widget _buildSectionTitle(context, String txt) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        txt,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _buildContainer(child) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey)),
        height: 190,
        width: double.infinity,
        margin: EdgeInsets.all(15),
        child: child);
  }

  static const routeName = '/Meal-details';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(selectedMeal.imageUrl),
            ),
            _buildSectionTitle(context, 'Ingrediants'),
            _buildContainer(
              ListView.builder(
                itemBuilder: (ctx, ind) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        selectedMeal.ingredients[ind],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            _buildSectionTitle(context, 'Steps'),
            _buildContainer(
              ListView.builder(
                itemBuilder: (ctx, ind) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${ind + 1}'),
                      ),
                      title: Text(selectedMeal.steps[ind]),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavo(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFunc(mealId),
      ),
    );
  }
}
