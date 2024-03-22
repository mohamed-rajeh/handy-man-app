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
              // the name of service
              Text(
                service.name!,
                style: MyThem.tfontStyle,
              ),
              // the price of service
              Text(
                "${service.price}  ${"dolar".tr}",
                style: MyThem.nfontStyle,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // the decription of service
          Text(
            service.description!,
            style: MyThem.nfontStyle,
          ),
          const SizedBox(height: 16),
          // the details of service

          Expanded(
            child: SingleChildScrollView(
              child: Text(
                service.details ?? "No details",
                style: MyThem.nfontStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
