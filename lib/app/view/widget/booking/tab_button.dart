import 'package:flutter/material.dart';

import '../../../../components/constant/them.dart';

class MyTabButton extends StatelessWidget {
  final String title;
  const MyTabButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: MyThem.secondaryColor,
            width: 1,
          )),
      height: 50,
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
