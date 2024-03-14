import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/constant/them.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.5,
        child: InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyThem.secondaryColor.withAlpha(90),
            ),
            alignment: Alignment.center,
            child: AutoSizeText(
              "logout".tr,
              minFontSize: 18,
              style: MyThem.nfontStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
