import 'package:flutter/material.dart';

import '../../../../components/constant/them.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required String id,
  }) : _id = id;

  final String _id;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: MyThem.primaryColor,
          child: Icon(
            Icons.timeline,
            size: 30,
            color: MyThem.secondaryColor,
          )),
      title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(" id : $_id"),
            Text(
              "Service",
              style: MyThem.nfontStyle,
            )
          ]),
      trailing: Text(
        "state",
        style: MyThem.nfontStyle,
      ),
    );
  }
}
