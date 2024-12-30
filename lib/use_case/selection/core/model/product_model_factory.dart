import 'package:use_case_flutter/use_case/selection/core/model/product_model.dart';

final class ProductModelFactory {
  factory ProductModelFactory.shopItems() {
    return ProductModelFactory._([
      ProductModel(id: '1', price: 100, stockId: '1'),
      ProductModel(id: '2', price: 200, stockId: '2'),
      ProductModel(id: '3', price: 300, stockId: '3'),
    ]);
  }
  const ProductModelFactory._(this.items);

  final List<ProductModel> items;
}
