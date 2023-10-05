import 'package:flutter/material.dart';

class LoLe extends StatefulWidget {
  const LoLe({super.key});

  @override
  State<LoLe> createState() => _LoLeState();
}

class _LoLeState extends State<LoLe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Lô lẻ'),
      ),
    );
  }
}