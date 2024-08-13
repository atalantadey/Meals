import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavMealsNotifier extends StateNotifier<List<Meal>> {
  FavMealsNotifier() : super([]);

  bool togglemealFavStatus(Meal meal) {
    final mealisFav = state.contains(meal);
    if (mealisFav) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealsProvider = StateNotifierProvider<FavMealsNotifier,List<Meal>>((ref) {
  return FavMealsNotifier();
});
