import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/models/cart_item_model.dart';
import 'package:quitandaapp/src/pages/components/quantidade_widget.dart';
import 'package:quitandaapp/src/services/utils_services.dart';

class CartTile extends StatelessWidget {
  CartTile({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      shadowColor: Colors.grey.shade300,
      color: Colors.white,
      child: ListTile(
        leading: Image.asset(
          cartItem.item.imageUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        subtitle: Text(utilsServices.priceToCurrency(cartItem.totalPrice),
            style: TextStyle(
              color: CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold,
            )),
        trailing: QuantidadeWidget(
          value: cartItem.quantity,
          sufixo: cartItem.item.unidadeMedida,
          result: (item) {},
        ),
      ),
    );
  }
}
