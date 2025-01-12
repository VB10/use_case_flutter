import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:use_case_flutter/use_case/selection/core/custom_selection_sheet.dart';
import 'package:use_case_flutter/use_case/selection/core/model/product_model.dart';
import 'package:use_case_flutter/use_case/selection/core/model/product_model_factory.dart';

class CustomSelectionDemoView extends StatefulWidget {
  const CustomSelectionDemoView({super.key});

  @override
  State<CustomSelectionDemoView> createState() =>
      _CustomSelectionDemoViewState();
}

class _CustomSelectionDemoViewState extends State<CustomSelectionDemoView> {
  /// mixin
  final _productModelNotifier = ValueNotifier<ProductModel?>(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Selection Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await CustomSelectionSheet.show<ProductModel>(
            context,
            items: ProductModelFactory.shopItems().items,
            builder: (BuildContext context, ProductModel item) {
              return _SelectionItem(
                productModel: item,
                isSelected: _productModelNotifier.value == item,
              );
            },
          );
          _productModelNotifier.value = response;
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: _productModelNotifier,
        builder: (context, value, child) {
          return Center(child: Text(value?.name ?? ''));
        },
      ),
    );
  }
}

/// A widget that displays a selection item.
/// [isSelected] is used to determine if the selection is selected.
/// [productModel] is the product model to display.
final class _SelectionItem extends StatelessWidget {
  const _SelectionItem({
    required this.productModel,
    required this.isSelected,
  });

  final ProductModel productModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context, productModel);
      },
      title: Text(productModel.name),
      subtitle: Text(productModel.price.toString()).ext.toVisible(
            value: productModel.price > 100,
          ),
      leading: Icon(
        Icons.check_circle,
        color: isSelected ? Colors.green : Colors.grey,
      ),
    );
  }
}
