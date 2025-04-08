import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  ItemModel({
    this.id = '',
    required this.itemName,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.unidadeMedida,
    this.quantity = 1,
  });

  String id;
  String itemName;
  String title;
  String description;
  double price;
  @JsonKey(name: 'picture')
  String imageUrl;
  String unidadeMedida;
  int quantity = 1;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  @override
  String toString() {
    return 'ItemModel(id: $id, itemName: $itemName, title: $title, description: $description, price: $price, imageUrl: $imageUrl, unidadeMedida: $unidadeMedida, quantity: $quantity)';
  }
}
