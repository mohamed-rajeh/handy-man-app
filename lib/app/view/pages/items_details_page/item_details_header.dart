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
      aspectRatio: 16 / 10,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: photo != null && photo!.isNotEmpty
            ? Image.network(getImageFromServer(photo!))
            : Image.asset("images/Logo.png"),
      ),
    );
  }
}
