import 'package:flutter/material.dart';
import 'package:meal_app/models/dummy_list.dart';
import './screens/category_meal_screen.dart';
//import 'screens/categories_screen.dart';
import './models/meal.dart';
import './screens/meal_detail_screen.dart';
import './screens/tab_screen.dart';
import './widgets/main_drawer.dart';
import './screens/filter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  _setFilter(Map<String, bool> currentFilter) {
    _filters = currentFilter;
    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['vegan'] && !meal.isVegan) {
        return false;
      }
      if (_filters['vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      if (_filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();
  }

  List<Meal> _favoriteList = [];
  void _toggleFavorite(String mealId) {
    int ispresent = _favoriteList.indexWhere((meal) => meal.id == mealId);

    if (ispresent >= 0) {
      _favoriteList.removeWhere((meal) {
        return meal.id == mealId;
      });
    } else {
      _favoriteList.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }

  bool _isFavorite(String mealId) {
    return _favoriteList.any((meal) => meal.id == mealId);
  }

  build(BuildContext context) {
    return MaterialApp(
        title: 'Meal App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          // canvasColor: Color.fromARGB(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                headline2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                subtitle1: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
        ),
        //home: CategoriesScreen(),
        routes: {
          '/': (ctx) => TabScreen(_favoriteList),
          CategoryMealScreen.routeNamed: (ctx) =>
              CategoryMealScreen(_availableMeals),
          MealDetailScreen.routeNamed: (ctx) =>
              MealDetailScreen(_toggleFavorite, _isFavorite),
          MainDrawer.routeNamed: (ctx) => FilterScreen(_setFilter, _filters),
        });
  }
}
