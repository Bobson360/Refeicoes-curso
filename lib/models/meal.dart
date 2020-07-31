import 'package:flutter/material.dart';
import 'package:meals/enum/complexity.dart';
import 'package:meals/enum/cost.dart';

class Meal{
  final String id;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final String title;
  final String imageUrl;
  final int duration;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.isGlutenFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.isLactoseFree,
    @required this.complexity,
    @required this.cost
  });

  String get complexityText{
    switch (complexity) {
      case Complexity.Simple:
        return 'Simples';
      case Complexity.Medium:
        return 'Média';
      case Complexity.Difficult:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }

    String get costText{
    switch (cost) {
      case Cost.Cheap:
        return '\$';
      case Cost.Fair:
        return '\$\$';
      case Cost.Expensive:
        return '\$\$';
      default:
        return 'Desconhecida';
    }
  }
}