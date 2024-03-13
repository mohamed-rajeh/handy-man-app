import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../components/constant/them.dart';

class HeaderPart extends StatelessWidget {
  const HeaderPart({super.key});

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 70,
          foregroundColor: MyThem.black,
          backgroundColor: MyThem.secondaryColor.withAlpha(70),
          child: const Icon(
            FontAwesomeIcons.ggCircle,
            size: 70,
          ),
        ),
        const Column(
          children: [
            AutoSizeText(
              "Wellcome",
              minFontSize: 30,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            AutoSizeText(
              "Ahmed!",
              minFontSize: 24,
              style: TextStyle(),
            )
          ],
        ),
      ],
    );
  }
}
