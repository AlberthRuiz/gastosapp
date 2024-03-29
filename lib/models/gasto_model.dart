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

  Map<String, dynamic> convertirAMapa() => {
        "title": title,
        "price": price,
        "datetime": datetime,
        "type": type,
      };

  factory GastoModel.convertirDeMapaAModelo(Map<String, dynamic> map) =>
      GastoModel(
        id: map["id"],
        title: map["title"],
        price: map["price"],
        datetime: map["datetime"],
        type: map["type"],
      );
}
