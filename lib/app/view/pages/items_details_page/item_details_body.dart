part of "item_details.dart";

class ItemBody extends StatelessWidget {
  final Service service;
  const ItemBody({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                service.name,
                style: MyThem.tfontStyle,
              ),
              Text(
                service.price.toString(),
                style: MyThem.nfontStyle,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            service.description,
            style: MyThem.nfontStyle,
          ),
          const SizedBox(height: 16),
          Text(
            service.details ?? "No details",
            style: MyThem.nfontStyle,
          ),
        ],
      ),
    );
  }
}
