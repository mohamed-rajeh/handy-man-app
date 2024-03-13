import 'package:flutter/material.dart';

import '../../widget/booking/custom_switch_list_tile.dart';

class CurentOrdersPage extends StatelessWidget {
  const CurentOrdersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(children: [
            for (int i = 0; i < 5; i++)
              CustomSwitchListTile(
                id: 1.toString(),
              )
          ]),
        ),
      ),
    );
  }
}
