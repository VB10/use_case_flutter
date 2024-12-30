import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:use_case_flutter/use_case/selection/core/custom_selection_abstract.dart';

/// A sheet that allows the user to select a custom selection.
/// [isSelected] is used to determine if the selection is selected.
final class CustomSelectionSheet<T extends CustomSelectionAbstract>
    extends StatelessWidget {
  const CustomSelectionSheet._({
    required this.items,
    required this.selected,
    super.key,
  });

  /// Shows the custom selection sheet.
  static Future<T?> show<T extends CustomSelectionAbstract>(
    BuildContext context, {
    required List<T> items,
    required T? selected,
  }) {
    return showModalBottomSheet<T?>(
      context: context,
      builder: (context) => CustomSelectionSheet._(
        items: items,
        selected: selected,
      ),
    );
  }

  final List<T> items;
  final T? selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _Notch(),
        ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final selection = items[index];
            return ListTile(
              onTap: () {
                Navigator.pop(context, selection);
              },
              title: Text(selection.name),
              leading: Icon(
                Icons.check_circle,
                color: selected == selection ? Colors.green : Colors.grey,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _Notch extends StatelessWidget {
  const _Notch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 5,
      indent: context.sized.dynamicWidth(.4),
      endIndent: context.sized.dynamicWidth(.4),
    );
  }
}
