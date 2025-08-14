
// a provider that stores all the favorite meals in a list of favorite meals

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
       FavoriteMealsNotifier() : super([]);

       bool toggleMealFavoriteStatus(Meal meal)
       {
         final mealIsFavorite = state.contains(meal);
         if(mealIsFavorite)
           {
             state = state.where((m)=> m.id != meal.id).toList();
             return false;
           } else {
           state = [...state, meal];
           return true;
         }
       }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref) {
  return FavoriteMealsNotifier();
}); // optimized for data that can change, more efficient than a provider