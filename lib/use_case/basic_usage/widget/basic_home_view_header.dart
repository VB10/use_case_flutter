part of '../basic_home_view.dart';

class _BasicHomeViewHeaderAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _BasicHomeViewHeaderAppBar({
    required this.userItemSelectedNotifier,
    super.key,
  });
  final ValueNotifier<String> userItemSelectedNotifier;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.homeStyle.appBarColor,
      title: Text(
        'Basic Usage',
        style: context.homeStyle.appBarTitleStyle,
      ),
      actions: [
        ValueListenableBuilder(
          valueListenable: userItemSelectedNotifier,
          builder: (context, value, child) => Text(value),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
