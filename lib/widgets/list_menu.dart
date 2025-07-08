import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  final String iconImage;
  final String title;
  final VoidCallback onTap;

  const ListMenu({
    super.key,
    required this.iconImage,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        iconImage,
        width: 24,
        height: 24,
        color: Color(0xFF1F1F1F),
      ),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
