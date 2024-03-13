import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/constant/them.dart';
import 'my_list_tile.dart';
import 'my_list_tile_with_details.dart';

class CustomSwitchListTile extends StatefulWidget {
  const CustomSwitchListTile({
    super.key,
    required String id,
  }) : _id = id;

  final String _id;

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
              firstChild: CustomListTile(id: widget._id),
              secondChild: CustomListTileWithDetails(id: widget._id),
              secondCurve: Curves.easeInOutQuart,
            )),
      ),
    );
  }
}
