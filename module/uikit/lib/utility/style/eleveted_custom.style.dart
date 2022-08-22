import 'package:flutter/material.dart';

class EmptyElevatedStyle extends ButtonStyle {
  EmptyElevatedStyle()
      : super(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        );
}
