import 'package:quitandaapp/src/models/item_model.dart';

class CartItemModel {
  final ItemModel item;
  final int quantity;
  final double unitPrice;
  final double totalPrice;

  CartItemModel({
    required this.item,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
  });
}
