import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/Category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 3 / 2,
        maxCrossAxisExtent: 200,
      ),
      children: DUMMY_CATEGORIES
          .map((e) => Categoryitem(e.id, e.title, e.color))
          .toList(),
    );
  }
}
