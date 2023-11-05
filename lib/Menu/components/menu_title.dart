import 'package:entradex/theme/app_textstyle.dart';
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
        minLeadingWidth: 0,
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.surface,
        ),
        title: Text(
          text,
          style: AppTextStyle.bodyMedium_15.copyWith(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        trailing: selected
            ? Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.surface,
                size: 12,
              )
            : null,
        onTap: () {},
      ),
    );
  }
}
