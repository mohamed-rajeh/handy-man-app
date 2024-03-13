part of "item_details.dart";

class ItemFooter extends StatelessWidget {
  const ItemFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyThem.primaryColor,
      alignment: Alignment.center,
      height: 60,
      width: double.maxFinite,
      child: Text(
        "Book now",
        style: MyThem.tfontStyle,
      ),
    );
  }
}
