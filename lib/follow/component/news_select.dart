import 'package:flutter/material.dart';

class NewsSelect extends StatelessWidget {
  String title;
  bool isSelected = false;
  NewsSelect({
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: 80,
      height: 24,
      decoration: BoxDecoration(
        color: isSelected ? Colors.red : Colors.grey[800],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
