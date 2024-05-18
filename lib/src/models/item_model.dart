class ItemModel {
  ItemModel({
    required this.itemName,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.unidadeMedida,
    this.quantity = 1,
  });

  String itemName;
  String title;
  String description;
  double price;
  String imageUrl;
  String unidadeMedida;
  int quantity = 1;
}
