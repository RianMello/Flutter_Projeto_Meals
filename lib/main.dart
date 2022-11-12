import 'package:flutter/material.dart';

import './screens/categories_meals.dart';
import './screens/tabs.dart';
import './screens/meal_details.dart';
import './screens/settings.dart';

import './utils/app_routes.dart';
import 'data/dummy_data.dart';

import 'models/meal.dart';
import '/models/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData theme = ThemeData();

  Settings settings = Settings(false, false, false, false);

  List<Meal> _availableMeal = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeal(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeal = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterVegetarian &&
            !filterLactose &&
            !filterVegan;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool isFavoriteMeal(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink[400],
          secondary: Colors.amber,
        ),
        // canvasColor: const Color.fromARGB(255, 253, 222, 129),
        textTheme: theme.textTheme.copyWith(
          headline1: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 20,
          ),
          headline2: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          headline3: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
      ),
      routes: {
        AppRoutes.home: (context) => TabsScreen(_favoriteMeals),
        AppRoutes.categoriesMeals: (context) =>
            CategoriesmMealsScreen(_availableMeal),
        AppRoutes.mealDetails: (context) =>
            MealDetailScreen(_toggleFavorite, isFavoriteMeal),
        AppRoutes.settings: (context) => SettingsScreen(_filterMeal, settings),
      },
    );
  }
}
