import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// Basic Home Card
/// title is required for the card
final class BasicHomeCard extends StatelessWidget {
  const BasicHomeCard({
    required this.title,
    this.onTap,
    super.key,
  });
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(title, style: context.general.textTheme.bodyMedium),
      ),
    );
  }
}
