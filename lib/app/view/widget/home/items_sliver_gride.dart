import 'package:flutter/material.dart';

import '../../../../components/animation/fade_in.dart';
import '../items/item.dart';
import '../../../model/service_model.dart';

class HomePopruleItem extends StatelessWidget {
  const HomePopruleItem({
    super.key,
    required this.service,
  });

  final List service;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
        ),
        itemCount: service.length,
        itemBuilder: (BuildContext context, int index) {
          Service s = service[index];

          return FadeInAnimation(
              delay: 1,
              direction: FadeInDirection.ttb,
              fadeOffset: 5,
              child: Item(service: s));
        });
  }
}
