import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.background.withOpacity(0.2),
            spreadRadius: 0.4,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(Icons.language_rounded, color: Colors.red),
        Container(
          width: size.width * 0.58,
          child: Text(
            ' Tìm mã để đặt lệnh',
            style: AppTextStyle.labelMedium_16.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.surface),
          ),
        ),
        Icon(Icons.search, color: Theme.of(context).colorScheme.surface),
      ]),
    );
  }
}
