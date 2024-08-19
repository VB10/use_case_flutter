import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:use_case_flutter/use_case/generic_filter/mixin/show_sheet_mixin.dart';

abstract class IFilter {
  String get key;
  int get id;
}

class FilterView<T extends IFilter> extends StatefulWidget {
  const FilterView({
    required List<T> values,
    super.key,
  }) : _values = values;

  final List<T> _values;

  @override
  State<FilterView> createState() => _FilterViewState<T>();
}

class _FilterViewState<T> extends State<FilterView> {
  late final List<IFilter> _countries;
  List<IFilter> filteredItems = [];

  @override
  void initState() {
    super.initState();
    _countries = widget._values;
    filteredItems = widget._values;
  }

  void _findItems(String value) {
    setState(() {
      filteredItems = _countries
          .where(
            (element) =>
                element.key.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(onChanged: _findItems),
        Expanded(
          child: ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  context.route.pop(filteredItems[index]);
                },
                title: Text(filteredItems[index].key),
                leading: const Icon(Icons.circle_outlined),
              );
            },
          ),
        ),
      ],
    );
  }
}

extension FilterViewExtension on FilterView {
  Future<T?> showSheet<T extends IFilter>({
    required BuildContext context,
    required List<T> items,
  }) {
    return ShowSheetMixin.showCustomSheet<T>(
      context: context,
      child: FilterView<T>(values: items),
    );
  }
}
