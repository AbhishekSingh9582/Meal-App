import 'package:flutter/material.dart';
import '../widgets/category_Item.dart';
import '../models/dummy_list.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      children: DUMMY_CATEGORIES
          .map((e) => CategoryItem(id: e.id, title: e.title, color: e.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
    );
  }
}
