import 'package:flutter/material.dart';

import '../../../../components/constant/them.dart';

class SectionButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;

  const SectionButton({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: MyThem.tertiaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: onTap,
          child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: MyThem.nfontStyle
                    .copyWith(color: MyThem.wight, fontSize: 24),
              )),
        ),
      ),
    );
  }
}
