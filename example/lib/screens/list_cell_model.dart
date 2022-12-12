import 'package:flutter/material.dart';

class ListCellModel {
  ListCellModel({
    required this.title,
    this.description = '',
    required this.onPressed,
  });

  final String title;
  final String description;
  final VoidCallback onPressed;
}
