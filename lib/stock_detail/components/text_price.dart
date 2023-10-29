import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Text_Prices extends StatelessWidget {
  final String label;
  final String value;
  Text_Prices({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15.sp,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
