class Order {
  final int id;
  final String custmor;
  final String sevice;
  final DateTime date;
  final String state;
  final String note;

  Order(
      {required this.id,
      required this.custmor,
      required this.sevice,
      required this.date,
      required this.state,
      required this.note});
}
