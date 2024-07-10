import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

// A class that helps manage state in a structured way
class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal); // state holds your data

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList(); // 整個新state係無呢個meal嘅
      return false;
    } else {
      state = [...state, meal]; // 整個新state係加上呢個meal
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>(
        ((ref) => FavoriteMealNotifier()));
// 最尾return and instantiate the notifier class
// <Generic> , type of the notifier and type of the state managed by the notifier
// StateNotifierProvider: Binds a StateNotifier to its state and makes it accessible throughout your app.