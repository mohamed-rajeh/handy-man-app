import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ser/components/constant/them.dart';

class MyLabel extends StatelessWidget {
  final String text;
  final double minTextSize;
  const MyLabel({
    super.key,
    required this.text,
    required this.minTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: minTextSize,
      style: TextStyle(fontWeight: FontWeight.bold, color: MyThem.grey),
    );
  }
}
