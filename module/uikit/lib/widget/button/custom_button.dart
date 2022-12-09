import 'package:flutter/material.dart';

import '../../utility/decoration/button_gradient_decoration.dart';
import '../../utility/style/eleveted_custom.style.dart';

enum CustomButtonSizes {
  small(30),
  medium(60),
  large(90);

  final double value;
  const CustomButtonSizes(this.value);
}

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    Key? key,
    this.onPressed,
    this.size = CustomButtonSizes.medium,
    required this.title,
    this.colorScheme,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final CustomButtonSizes size;
  final String title;

  /// [onError] in scheme
  final ColorScheme? colorScheme;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: EmptyElevatedStyle(),
        onPressed: onPressed,
        child: SizedBox(
          height: size.value,
          child: DecoratedBox(
              decoration: ButtonDecoration(colorScheme ?? Theme.of(context).colorScheme),
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Theme.of(context).colorScheme.onError,
                      ),
                ),
              )),
        ));
  }
}
