import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/view/pages/profile/account_setting_page.dart';
import 'package:ser/app/view/widget/profile/my_lable.dart';
import 'package:ser/app/view/widget/profile/my_list_tile.dart';

import '../../../../components/constant/them.dart';
import '../../pages/profile/location_setting_page.dart';

class BodyPart extends StatelessWidget {
  const BodyPart({super.key});

  @override
  Widget build(context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Profile section
      const MyLabel(text: "Profile", minTextSize: 20),
      const SizedBox(height: 10),
      MyListTile(
        onTap: () => Get.to(const AccountSettingPage()),
        icon: Icons.account_circle_outlined,
        iconColor: MyThem.secondaryColor,
        title: "Account",
      ),
      const SizedBox(height: 10),
      MyListTile(
        onTap: () => Get.to(const LocationSettingPage()),
        icon: Icons.location_on,
        iconColor: MyThem.secondaryColor,
        title: "Location",
      ),
      // End profile section
      const SizedBox(height: 25),
      // settings section
      const MyLabel(text: "Settings", minTextSize: 20),
      const SizedBox(height: 10),
      const DarkModeListTile(),
      const SizedBox(height: 10),
      MyListTile(
        icon: Icons.info_outline_rounded,
        iconColor: MyThem.secondaryColor,
        title: " App info",
        widget: const SizedBox.shrink(),
      ),
      // End settings section
    ]);
  }
}

class DarkModeListTile extends StatelessWidget {
  const DarkModeListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var switchValue = false.obs;
    return MyListTile(
        icon: Icons.dark_mode,
        iconColor: MyThem.secondaryColor,
        title: "Dark mode",
        widget: Obx(() => Switch(
            activeColor: MyThem.secondaryColor,
            activeTrackColor: MyThem.primaryColor,
            value: switchValue.value,
            onChanged: (value) {
              switchValue.value = value;
            })));
  }
}
