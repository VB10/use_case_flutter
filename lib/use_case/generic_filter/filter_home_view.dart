import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/generic_filter/model/color_model.dart';
import 'package:use_case_flutter/use_case/generic_filter/model/country.dart';

import 'filter_view.dart';
import 'mixin/show_sheet_mixin.dart';

class FilterHomeView extends StatefulWidget {
  const FilterHomeView({Key? key}) : super(key: key);
  @override
  State<FilterHomeView> createState() => _FilterHomeViewState();
}

class _FilterHomeViewState extends State<FilterHomeView> {
  final List<Country> _countries = Countries.models;

  String _name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_name)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await FilterView<ColorModels>(values: ColorEnums.models)
                  .showSheet(context: context, items: ColorEnums.models);

          final result2 = await FilterView<Country>(values: Countries.models)
              .showSheet<Country>(context: context, items: Countries.models);

          if (result == null) return;

          setState(() {
            _name = result.key;
          });
        },
      ),
    );
  }
}
