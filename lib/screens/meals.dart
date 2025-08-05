//*********************************************************************************//
  // This page will show all the meals when the category is clicked
//*******************************************************************************//
import 'package:flutter/material.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,
                       this.title,
                 required this.meals,
   });

final String? title;
final List<Meal> meals;

void selectMeal(BuildContext context, Meal meal) {
  Navigator.pop(context);
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> MealDetailsScreen(meal: meal),),);
}


   @override
  Widget build(BuildContext context) {
     Widget content = Center(
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           Text('Uh oh... nothing here!',
             style: Theme.of(context).textTheme.headlineLarge!.copyWith(
               color: Theme.of(context).colorScheme.onSurfaceVariant,
             ),
           ),
           SizedBox(height: 16,),
           Text('Try selecting a different category!',
             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
               color: Theme.of(context).colorScheme.onSurfaceVariant,
             ),
           ),
         ],
       ),
     );

     if(meals.isNotEmpty) {
          content =  ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx,index) => MealItem(
                meal: meals[index],
                onSelectMeal: (ctx,meal) {
                  selectMeal(context, meal);
                },
            ),
          );
     }

     if(title== null)
       {
         return content; // if title is null it runs here
       }
      return Scaffold( // any widget that is used for display will return scaffold
         appBar: AppBar(
           title: Text(title!), // but if not, then this is executed
         ),
        body: content,
      );
  }


}