import 'package:flutter/material.dart';

class ListCellModel {
  ListCellModel({
    required this.title,
    required this.description,
    required this.onPressed,
  });

  final String title;
  final String description;
  final VoidCallback onPressed;
}