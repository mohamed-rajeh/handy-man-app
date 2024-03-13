import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../components/constant/them.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.iconColor,
    this.onTap,
    this.widget,
  });
  final IconData icon;
  final String title;
  final Color iconColor;
  final Widget? widget;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: iconColor.withAlpha(70),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: iconColor.withAlpha(40),
        radius: 26,
        child: Icon(
          icon,
          size: 30,
          color: iconColor,
        ),
      ),
      title: AutoSizeText(
        title,
        minFontSize: 16,
        style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
      trailing: widget ??
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyThem.grey.withAlpha(70),
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
    );
  }
}
