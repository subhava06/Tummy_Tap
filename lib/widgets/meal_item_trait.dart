//**********************************************************//
// To dynamically generate metadata for each individual meal item
//**************************************************************//
import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait(
      {super.key,
       required this.icon,
       required this.label,
      });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon,
        size: 17,
        color: Colors.white,
      ),
      SizedBox(width: 6),
      Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),),
    ],);
  }
}
