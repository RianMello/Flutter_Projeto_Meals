import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';

import '../components/meal_item.dart';

class CategoriesmMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesmMealsScreen(this.meals);
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where(
      (meal) {
        return meal.categories.contains(category.id);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeals[index]);
          },
        ),
      ),
    );
  }
}