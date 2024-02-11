class GastoModel {
  int? id;
  String title;
  double price;
  String datetime;
  String type;

  GastoModel({
    this.id,
    required this.title,
    required this.price,
    required this.datetime,
    required this.type,
  });
}
