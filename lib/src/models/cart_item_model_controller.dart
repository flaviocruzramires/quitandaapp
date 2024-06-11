import 'package:get/get.dart';
import 'package:quitandaapp/src/models/cart_item_model.dart';
import 'package:quitandaapp/src/models/item_model.dart';

class CartItemModelController extends GetxController {
  Rx<CartItemModel> cartItem = [].obs as Rx<CartItemModel>;

  void addItem(ItemModel item) {
    cartItem.value = CartItemModel(
      item: item,
      quantity: item.quantity,
      unitPrice: item.price,
      totalPrice: item.price,
    );
    update();
  }
}
