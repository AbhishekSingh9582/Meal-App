import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeNamed = '/category-meal';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  List<Meal> displayMeals;
  String categoryTitle;
  bool _loadedInitState = false;
  // List<Meals>
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitState) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      final String categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
    }
    _loadedInitState = true;
  }

  void _removeItem(String mealId) {
    // setState(() {
    //   displayMeals.removeWhere((element) => element.id == mealId);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            affordability: displayMeals[index].affordability,
            complexity: displayMeals[index].complexity,
            function: _removeItem,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
