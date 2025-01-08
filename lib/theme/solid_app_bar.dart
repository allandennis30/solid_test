import 'package:flutter/material.dart';

class SolidAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SolidAppBar({
    super.key,
    required this.title,
    this.subtitle,
  });

  static double get height => const Size.fromHeight(kToolbarHeight).height;

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
