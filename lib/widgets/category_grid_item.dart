
//*****************************************************************************************//
// This file will contain a widget that will be used to display a grid for a single category
//************************************************************************//

import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
 const CategoryGridItem({super.key, required this.category});

  final Category category; // it is imported from the models folder that contains the blueprint

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16), // add padding of 16 pixels in all directions
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withAlpha((0.55 * 255).toInt()),
              category.color.withAlpha((0.9 * 255).toInt()),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).
          textTheme.titleLarge!.
          copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      );

  }
}