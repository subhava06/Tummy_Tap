import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

   @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,// makes sure this animation executes for every frame
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

     _animationController.forward(); // starts the animation
  }

  @override
  void dispose() {
    _animationController.dispose(); // remove this when we leave the screen
    super.dispose();
  }

  //method to call when we press a category
  void _selectCategory(BuildContext context, Category category) {
   final filteredMeals = widget.availableMeals
       .where((meal) => meal.categories.contains(category.id)).toList();
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
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
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
        builder: (context,child) => SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.3),
              end: Offset(0, 0),
            ).animate(CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
            ),
            ),
          child: child,

        ),

           /* Padding(
      padding: EdgeInsets.only(top:100 - _animationController.value * 100,
      ),
      child: child,
    ),*/
    );

  }
}
