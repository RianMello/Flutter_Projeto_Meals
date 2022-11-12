import 'package:flutter/material.dart';

enum Complexity {
  simple,
  medium,
  difficult,
}

enum Cost {
  cheap,
  fair,
  expensive,
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final List<String> steps;
  final List<String> ingredients;
  final List<String> categories;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.duration,
    required this.imageUrl,
    required this.ingredients,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.steps,
    required this.title,
    required this.complexity,
    required this.cost,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Simples";
      case Complexity.medium:
        return "Normal";
      case Complexity.difficult:
        return "Difícil";
      default:
        return 'Indeterminada';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return "Barato";
      case Cost.fair:
        return "Justo";
      case Cost.expensive:
        return "Caro";
      default:
        return 'Indeterminado';
    }
  }
}
