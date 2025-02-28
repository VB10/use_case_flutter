part of '../basic_home_view.dart';

class _BasicHomeViewList extends StatelessWidget {
  const _BasicHomeViewList({
    required this.items,
    required this.onCardBodyPressWithNavigate,
    super.key,
  });

  final List<String> items;
  final ValueChanged<String> onCardBodyPressWithNavigate;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      padding: HomeStyle.appBarPadding,
      itemBuilder: (context, index) {
        return BasicHomeCard(
          title: items[index],
          onTap: () => onCardBodyPressWithNavigate(items[index]),
        );
      },
    );
  }
}
