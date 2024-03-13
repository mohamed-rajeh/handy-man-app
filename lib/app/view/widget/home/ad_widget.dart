import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../components/constant/them.dart';

class AdWidget extends StatelessWidget {
  const AdWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 190,
        decoration: BoxDecoration(
            color: MyThem.primaryColor, borderRadius: BorderRadius.circular(5)),
        child: const Center(
            child: AutoSizeText(
          "AD",
          minFontSize: 24,
        )),
      ),
    );
  }
}
