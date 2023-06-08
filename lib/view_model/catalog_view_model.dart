import 'package:flutter/material.dart';
import 'package:flutter_training/models/catalog_model.dart';

class CatalogViewModel extends ChangeNotifier {
  List<CatalogModel> allCatalogModels = [
    CatalogModel(
      name: 'Red',
      color: Colors.redAccent,
      price: 400,
    ),
    CatalogModel(
      name: 'Orange',
      color: Colors.orangeAccent,
      price: 700,
    ),
    CatalogModel(
      name: 'Yellow',
      color: Colors.yellowAccent,
      price: 600,
    ),
    CatalogModel(
      name: 'Purple',
      color: Colors.purpleAccent,
      price: 500,
    ),
    CatalogModel(
      name: 'Green',
      color: Colors.greenAccent,
      price: 300,
    ),
    CatalogModel(
      name: 'Blue',
      color: Colors.blueAccent,
      price: 100,
    ),
  ];
  List<CatalogModel> addedCatalogModels = [];

  void addCatalogModel(CatalogModel catalogModel) {
    addedCatalogModels.add(catalogModel);
    allCatalogModels.remove(catalogModel);
    notifyListeners();
  }

  void removeCatalogModel(CatalogModel catalogModel) {
    addedCatalogModels.remove(catalogModel);
    allCatalogModels.add(catalogModel);
    notifyListeners();
  }

  double getTotalPrice() {
    double sum = 0;
    for (CatalogModel catalogModel in addedCatalogModels) {
      sum = sum + catalogModel.price;
    }
    return sum;
  }
}
