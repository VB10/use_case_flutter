import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:use_case_flutter/use_case/selection/core/custom_selection_abstract.dart';

/// A builder that builds a widget for a given item.
typedef SelectionWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T item,
);

/// A sheet that allows the user to select a custom selection.
/// [isSelected] is used to determine if the selection is selected.
final class CustomSelectionSheet<T extends CustomSelectionAbstract>
    extends StatelessWidget {
  const CustomSelectionSheet._({
    required this.items,
    required this.builder,
    super.key,
  });

  /// Shows the custom selection sheet.
  static Future<T?> show<T extends CustomSelectionAbstract>(
    BuildContext context, {
    required List<T> items,
    required SelectionWidgetBuilder<T> builder,
  }) {
    return showModalBottomSheet<T?>(
      context: context,
      builder: (context) => CustomSelectionSheet._(
        items: items,
        builder: builder,
      ),
    );
  }

  final List<T> items;
  final SelectionWidgetBuilder<T> builder;

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
            return builder(context, selection);
            // return ListTile(
            //   onTap: () {
            //     Navigator.pop(context, selection);
            //   },
            //   title: Text(selection.name),
            //   leading: Icon(
            //     Icons.check_circle,
            //     color: selected == selection ? Colors.green : Colors.grey,
            //   ),
            // );
          },
        ),
      ],
    );
  }
}

final class _Notch extends StatelessWidget {
  const _Notch();

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 5,
      indent: context.sized.dynamicWidth(.4),
      endIndent: context.sized.dynamicWidth(.4),
    );
  }
}
