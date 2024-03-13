import 'package:flutter/material.dart';

import '../../../../components/shared/item.dart';
import '../../../model/service_model.dart';

class ItemsSliverGride extends StatelessWidget {
  const ItemsSliverGride({
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

          return Item(service: s);
        });
  }
}
