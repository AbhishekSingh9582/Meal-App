import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function function;

  MealItem(
      {this.title,
      this.imageUrl,
      this.id,
      this.duration,
      this.complexity,
      this.affordability,
      this.function});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeNamed, arguments: id)
        .then((mealId) {
      if (mealId != null) {
        function(mealId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      splashColor: Colors.red,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                    bottom: 15,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.black54,
                      child: Text(title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      width: 300,
                    ))
              ],
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 5,
                        ),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 5,
                        ),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 5,
                        ),
                        Text(affordabilityText)
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
