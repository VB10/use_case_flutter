import 'package:flutter/material.dart';
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
            selected: _productModelNotifier.value,
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
