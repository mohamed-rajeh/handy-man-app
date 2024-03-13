import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../components/constant/them.dart';

class CustomListTileWithDetails extends StatelessWidget {
  const CustomListTileWithDetails({
    super.key,
    required String id,
  }) : _id = id;

  final String _id;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  " id : $_id",
                  style: MyThem.nfontStyle,
                ),
                const SizedBox(width: 20),
                const Icon(
                  Icons.copy,
                  size: 16,
                ),
              ],
            ),
            Text(
              "Service",
              style: MyThem.nfontStyle,
            ),
            Text(
              "Price",
              style: MyThem.nfontStyle,
            ),
            Text(
              "State : ",
              style: MyThem.nfontStyle,
            )
          ]),
      trailing: InkWell(
        onTap: () {},
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                color: MyThem.secondaryColor.withAlpha(70),
                borderRadius: BorderRadius.circular(10)),
            child: AutoSizeText(
              "Cancle",
              minFontSize: 14,
              style: TextStyle(color: MyThem.black),
            )),
      ),
    );
  }
}
