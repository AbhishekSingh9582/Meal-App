import 'package:flutter/material.dart';
import '../models/dummy_list.dart';

class MealDetailScreen extends StatefulWidget {
  final Function _toggleFavorite;
  final Function isFavorite;
  MealDetailScreen(this._toggleFavorite, this.isFavorite);
  static const routeNamed = '/meal-detail-screen';

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget commonTitleSection(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.bodyText1),
    );
  }

  Widget commonContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        height: 200,
        width: 350,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(mealId);
            }),
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover)),
            commonTitleSection(context, 'INGREDIENT'),
            commonContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                    elevation: 4,
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      child: Text('${selectedMeal.ingredients[index]}'),
                    )),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            commonTitleSection(context, 'STEPS'),
            commonContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(children: [
                  ListTile(
                    leading: CircleAvatar(child: Text('# ${index + 1}')),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(),
                ]),
                itemCount: selectedMeal.steps.length,
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget._toggleFavorite(mealId);
          });
        },
        child: widget.isFavorite(mealId)
            ? Icon(Icons.star)
            : Icon(Icons.star_border),
      ),
    );
  }
}
