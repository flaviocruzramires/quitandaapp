import 'package:get/get.dart';
import 'package:quitandaapp/src/models/cart_item_model.dart';

class CarrinhoControler extends GetxController {
  RxList<CartItemModel> carrinho = <CartItemModel>[].obs;

  int getTamanhoCarrinho() {
    return carrinho.length;
  }

  void addItem(CartItemModel item) {
    carrinho.add(item);
    update();
  }
}
