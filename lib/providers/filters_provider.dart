import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter,bool>> {
  FiltersNotifier() : super({
    Filter.glutenFree : false,
    Filter.lactoseFree : false,
    Filter.vegetarian : false,
    Filter.vegan : false,
  });

  void setFilter(Filter filter, bool isActive) {
    //state[filter] = isActive; // not allowed to mutate state directly
    state = {
      ...state, // copies key value pairs of existing map into this new map
      filter : isActive,
    };
  }
}

final filtersProvider =
StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>(
    ref) => FiltersNotifier(),
);