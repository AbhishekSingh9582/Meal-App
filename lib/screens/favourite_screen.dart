import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  FavouriteScreen(this.favoriteMeal);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  _removeItem(String mealId) {
    setState(() {
      widget.favoriteMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeal.isEmpty)
      return Center(
          child: Container(
              child: Text('No Favorite Yet, Add something!',
                  style: Theme.of(context).textTheme.subtitle1)));
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favoriteMeal[index].id,
            title: widget.favoriteMeal[index].title,
            imageUrl: widget.favoriteMeal[index].imageUrl,
            duration: widget.favoriteMeal[index].duration,
            affordability: widget.favoriteMeal[index].affordability,
            complexity: widget.favoriteMeal[index].complexity,
            function: _removeItem,
          );
        },
        itemCount: widget.favoriteMeal.length,
      );
    }
  }
}
