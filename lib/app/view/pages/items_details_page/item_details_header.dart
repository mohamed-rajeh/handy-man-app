part of "item_details.dart";

class ItemHeader extends StatelessWidget {
  final String? photo;
  const ItemHeader({
    super.key,
    this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: MyThem.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
