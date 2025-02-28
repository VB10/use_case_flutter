import 'package:flutter/material.dart';
import 'package:use_case_flutter/product/widget/card/basic_home_card.dart';
import 'package:use_case_flutter/use_case/basic_usage/basic_home_view_mixin.dart';
import 'package:use_case_flutter/use_case/basic_usage/widget/manager/basic_usage_manager.dart';
import 'package:use_case_flutter/use_case/basic_usage/widget/style/basic_home_style.dart';

part './widget/basic_home_view_bottom.dart';
part './widget/basic_home_view_card.dart';
part './widget/basic_home_view_header.dart';

class BasicHomeView extends StatefulWidget {
  const BasicHomeView({super.key});

  @override
  State<BasicHomeView> createState() => _BasicHomeViewState();
}

class _BasicHomeViewState extends State<BasicHomeView>
    with BasicHomeServiceMixin, BasicHomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _BasicHomeViewBottomAppBar(),
      appBar: _BasicHomeViewHeaderAppBar(
        userItemSelectedNotifier: userItemSelectedNotifier,
      ),
      body: _BasicHomeViewList(
        items: items,
        onCardBodyPressWithNavigate: (item) {
          addItem(item);
          context.manager.onCardBodyPressWithNavigate();
        },
      ),
    );
  }
}

extension _HomeStyleExtension on BuildContext {
  HomeStyle get homeStyle => HomeStyle(context: this);
  BasicUsageManager get manager => BasicUsageManager(context: this);
}
