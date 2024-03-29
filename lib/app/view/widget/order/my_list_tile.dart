import 'package:flutter/material.dart';

import 'package:ser/app/model/order_model.dart';

import 'package:ser/helper/function.dart';

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
          child: _order.service!.picture == null
              ? Icon(
                  Icons.timeline,
                  size: 30,
                  color: MyThem.secondaryColor,
                )
              : Image.network(getImageFromServer(_order.service!.picture!))),
      title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _order.service!.name!,
              style: MyThem.nfontStyle,
            ),
            Text((_order.date!.month.toString())),
          ]),
      trailing: Text(
        _order.state!.name!,
        style: MyThem.nfontStyle,
      ),
    );
  }
}
