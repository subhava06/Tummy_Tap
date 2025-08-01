 // *************************************************************//
    // A blueprint to describe how the structure of category should look like
 // *************************************************************//
import 'package:flutter/material.dart';

 class Category {

   Category ({
     required this.id,
     required this.title,
     this.color = Colors.orange,
 });

  final String id;
  final String title;
  final Color color;
 }