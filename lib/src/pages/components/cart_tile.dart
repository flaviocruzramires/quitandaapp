import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/models/cart_item_model.dart';
import 'package:quitandaapp/src/pages/components/quantidade_widget.dart';
import 'package:quitandaapp/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  CartTile({
    super.key,
    required this.cartItem,
    required this.remove,
  });

  CartItemModel cartItem;
  final Function(CartItemModel) remove;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
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
          widget.cartItem.item!.imageUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cartItem.item!.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        subtitle:
            Text(UtilsServices.priceToCurrency(widget.cartItem.totalPrice!),
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                  fontWeight: FontWeight.bold,
                )),
        trailing: QuantidadeWidget(
          value: widget.cartItem.quantity!,
          sufixo: widget.cartItem.item!.unidadeMedida,
          result: (item) {
            setState(
              () {
                widget.cartItem.quantity = item;

                // atualizando o valor total do item carrinho
                widget.cartItem.totalPrice = item * widget.cartItem.item!.price;

                if (widget.cartItem.quantity == 0) {
                  widget.remove(widget.cartItem);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
