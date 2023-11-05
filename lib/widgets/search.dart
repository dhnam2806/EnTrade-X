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
            color: Color.fromARGB(255, 45, 44, 44).withOpacity(0.1),
            spreadRadius: 0.4,
            blurRadius: 2,
            offset: Offset(0, 2),
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
