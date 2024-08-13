import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FliterNotifier extends StateNotifier<Map<Filter, bool>> {
  FliterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });
  void setFilters(Map<Filter,bool> chosenFilters){
    state=chosenFilters;
  }


  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider = StateNotifierProvider<FliterNotifier,Map<Filter,bool>>(
  (ref) => FliterNotifier(),
);

final filteredMealsProvider = Provider((ref){

  final meals=ref.watch(mealsProvider);
  final activefilters=ref.watch(filterProvider);

  return  meals.where((meal) {
    if (activefilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activefilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activefilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activefilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});