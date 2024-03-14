part of "item_details.dart";

class ItemFooter extends StatelessWidget {
  const ItemFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyButton(lable: "bookNow".tr, color: MyThem.secondaryColor);
  }
}
