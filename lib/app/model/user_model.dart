class User {
  final int id;
  final String name;
  final String phone;
  final DateTime date;
  final String password;
  final int address;
  final bool available;

  User(
      {required this.id,
      required this.name,
      required this.phone,
      required this.date,
      required this.password,
      required this.address,
      required this.available});
}
