import 'dart:developer';

import 'package:flutter/material.dart';

class CatalogModel {
  final String name;
  final Color color;
  final double price;

  CatalogModel({
    required this.name,
    required this.color,
    required this.price,
  });

  void printDetails() {
    log('CatalogModel( name : $name, price : $price)');
  }
}
