import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

import '../models/category.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  //method to call when we press a category
  void _selectCategory(BuildContext context, Category category) {
   final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).
    push(MaterialPageRoute(
        builder: (ctx)=>MealsScreen(
            title: category.title,
            meals: filteredMeals,
        ),
    ),
    ); // Navigator.push(context,route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('Pick your Category'),
        centerTitle: true,
      ),
      body: GridView(
        padding: EdgeInsets.all(24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,),
         // itemBuilder: itemBuilder,
        children: [
          // alternate way: availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for(final category in availableCategories)
             CategoryGridItem(category: category,
                              onSelectCategory: () {
                                _selectCategory(context,category);
                              },
             ),
        ],
      ),
    );
  }
}
