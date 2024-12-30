import 'package:use_case_flutter/use_case/selection/core/custom_selection_abstract.dart';

final class ProductModel extends CustomSelectionAbstract {
  ProductModel({
    required this.id,
    required this.price,
    required this.stockId,
  });

  @override
  final String id;
  final int price;
  final String stockId;

  @override
  String get name => 'custom product $id';
}
