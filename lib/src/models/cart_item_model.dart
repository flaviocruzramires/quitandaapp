import 'package:quitandaapp/src/models/item_model.dart';

class CartItemModel {
  final ItemModel? item;
  int? quantity;
  final double? unitPrice;
  double? totalPrice;

  CartItemModel({
    required this.item,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
  });

  int getQtdItensCarrinho() {
    return quantity!;
  }

  CartItemModel newCartItemModel() {
    CartItemModel item = CartItemModel(
      item: null,
      quantity: 0,
      unitPrice: 0.0,
      totalPrice: 0.0,
    );
    return item;
  }
}
