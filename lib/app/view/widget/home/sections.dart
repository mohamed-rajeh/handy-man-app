import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'section_button.dart';

class Sections extends StatelessWidget {
  const Sections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Row(
        children: [
          SectionButton(
            title: "IT",
            onTap: () =>
                Get.toNamed("it_section", arguments: {"title": "IT", "id": 2}),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                SectionButton(
                  title: "Home",
                  onTap: () => Get.toNamed("home_section",
                      arguments: {"title": "Home", "id": 1}),
                ),
                const SizedBox(height: 10),
                SectionButton(
                  title: "More",
                  onTap: () => Get.toNamed("more_section",
                      arguments: {"title": "More", "id": 0}),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
