import 'package:flutter/material.dart';

import '../../../components/constant/them.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/nodata.png"),
          const SizedBox(
            height: 16,
          ),
          Text(
            "No orders yet!",
            style: MyThem.nfontStyle,
          ),
        ],
      ),
    );
  }
}
