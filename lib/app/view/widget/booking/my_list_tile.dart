import 'package:flutter/material.dart';
import 'package:ser/app/model/order_model.dart';

import '../../../../components/constant/them.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required Order order,
  }) : _order = order;

  final Order _order;

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
            Text(" order : ${_order.id}"),
            Text(
              _order.service!.name!,
              style: MyThem.nfontStyle,
            )
          ]),
      trailing: Text(
        _order.state!.name!,
        style: MyThem.nfontStyle,
      ),
    );
  }
}
