part of '../basic_home_view.dart';

class _BasicHomeViewBottomAppBar extends StatelessWidget {
  const _BasicHomeViewBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: context.homeStyle.appBarColor,
      child: Padding(
        padding: HomeStyle.appBarPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => context.manager.showPlusSnackMessage(),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
