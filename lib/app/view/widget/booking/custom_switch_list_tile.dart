import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/model/order_model.dart';

import '../../../../components/constant/them.dart';
import 'my_list_tile.dart';
import 'my_list_tile_with_details.dart';

class CustomSwitchListTile extends StatefulWidget {
  const CustomSwitchListTile({
    super.key,
    required Order item,
  }) : _order = item;

  final Order _order;

  @override
  State<CustomSwitchListTile> createState() => _CustomListTailState();
}

class _CustomListTailState extends State<CustomSwitchListTile> {
  final RxBool _isListTileShown = RxBool(true);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: MyThem.secondaryColor.withAlpha(70),
        onTap: () => _isListTileShown.value = !_isListTileShown.value,
        child: Obx(() => AnimatedCrossFade(
              crossFadeState: _isListTileShown.value
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
              firstChild: CustomListTile(order: widget._order),
              secondChild: CustomListTileWithDetails(order: widget._order),
              secondCurve: Curves.easeInOutQuart,
            )),
      ),
    );
  }
}
