// ignore_for_file: must_be_immutable

import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldCustom extends StatefulWidget {
  String title;
  Function onTapRemove;
  Function onTapAdd;
  TextEditingController controller;
  bool enabled;
  bool isBuy;
  bool isZero;
  TextFieldCustom({
    required this.controller,
    required this.title,
    required this.onTapRemove,
    required this.onTapAdd,
    this.enabled = true,
    this.isBuy = true,
    this.isZero = false,
  });

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              widget.onTapRemove();
            },
            child: Icon(
              Icons.remove,
              color: Theme.of(context).colorScheme.secondary,
            )),
        Container(
          width: 80.w,
          child: TextField(
            inputFormatters: widget.title == "Giá đặt"
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                  ]
                : <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+')),
                  ],
            enabled: widget.title == "Khối lượng" ? true : widget.enabled,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            controller: widget.controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.title,
              hintStyle: TextStyle(
                color: AppColors.gray,
                fontSize: 14.sp,
              ),
            ),
            style: AppTextStyle.labelSmall_14.copyWith(
                fontWeight: FontWeight.w400,
                color: widget.isBuy == false
                    ? Theme.of(context).colorScheme.primary
                    : widget.isZero == true
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).textTheme.labelSmall!.color),
          ),
        ),
        GestureDetector(
            onTap: () {
              widget.onTapAdd();
            },
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.secondary,
            )),
      ],
    );
  }
}
