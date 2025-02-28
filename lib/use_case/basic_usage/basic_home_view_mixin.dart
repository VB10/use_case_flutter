import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/basic_usage/basic_home_view.dart';

mixin BasicHomeViewMixin on State<BasicHomeView>, BasicHomeServiceMixin {
  final List<String> _userItems = List.generate(5, (index) => 'Item $index');
  UnmodifiableListView<String> get items => UnmodifiableListView(_userItems);

  final ValueNotifier<String> userItemSelectedNotifier = ValueNotifier('');

  void addItem(String item) {
    _userItems.add(item);
    userItemSelectedNotifier.value = item;
  }

  void removeItem(String item) {
    _userItems.remove(item);
    userItemSelectedNotifier.value = _userItems.first;
  }
}

mixin BasicHomeServiceMixin on State<BasicHomeView> {}
