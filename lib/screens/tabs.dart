import 'package:flutter/material.dart';
//import 'package:meals/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

import '../models/meal.dart';
import '../providers/filters_provider.dart';

var kInitialFilters = {
  Filter.glutenFree : false,
  Filter.lactoseFree : false,
  Filter.vegetarian : false,
  Filter.vegan : false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {

  int _selectedPageIndex = 0;
  //store the selected filters
  Map<Filter, bool> _selectedFilters = kInitialFilters ;



  // Function to add or remove a meal from favorites
  // void _toggleMealFavoriteStatus(Meal meal)
  // {
  //   final isExisting = _favoriteMeals.contains(meal); // to check if the meal is already in the list
  //   if(isExisting)
  //     {
  //       setState(() {
  //         _favoriteMeals.remove(meal);
  //
  //       });
  //       _showInfoMessage('Meal is no longer a favorite');
  //     }
  //   else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //     });
  //     _showInfoMessage('Marked as a favorite');
  //   }
  // } // no longer need this func as we have a provider

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  //allows to open the screen as selected in the drawer widget: passed from function in the main_drawer.dart file
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
   if(identifier == 'filters') {

    final result = await Navigator.of(context).push<Map<Filter, bool>>(
      MaterialPageRoute(builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters,)),
    );
    setState(() {
      _selectedFilters = result ?? kInitialFilters;
    });

   }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);           // set up listeners to our provider
    final availableMeals = meals.where((meal){
      if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree)
        {return false;}
      if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree)
        {return false;}
      if(_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian)
        {return false;}
      if(_selectedFilters[Filter.vegan]! && !meal.isVegan)
        {return false;}
      return true;
    }
    ).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );

    var activePageTitle = 'Categories';

    if(_selectedPageIndex == 1)
      {
        final favoriteMeals = ref.watch(favoriteMealsProvider);
        activePage = MealsScreen(
          meals: favoriteMeals,
        );
        activePageTitle = 'Your favorites';
      }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ],
      ),
    );
  }
}
