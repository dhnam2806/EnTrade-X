// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MenuTitle extends StatelessWidget {
  IconData icon;
  String text;
  bool selected = true;
  MenuTitle({
    required this.icon,
    required this.text,
    this.selected = true,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.surface,
        ),
        title: Text(text),
        trailing: selected
            ? Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.tertiary,
                size: 16,
              )
            : null,
        onTap: () {},
      ),
    );
  }
}
