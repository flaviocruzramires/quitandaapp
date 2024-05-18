import 'package:flutter/material.dart';
import 'package:quitandaapp/src/models/cart_item_model.dart';
import 'package:quitandaapp/src/pages/components/cart_tile.dart';
import 'package:quitandaapp/src/pages/components/custom_app_bar.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/services/utils_services.dart';
import 'package:quitandaapp/src/config/app_data.dart' as app_data;

class CardTab extends StatefulWidget {
  CardTab({super.key});

  @override
  State<CardTab> createState() => _CardTabState();
}

class _CardTabState extends State<CardTab> {
  CustomAppBar appBar() => CustomAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.shopping_cart,
              color: CustomColors.customCardColor,
            ),
          ),
        ],
      );

  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    double totalGeral = 0.0;

    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(2),
              itemCount: app_data.cartItems.length,
              itemBuilder: (_, index) {
                totalGeral += app_data.cartItems[index].totalPrice;
                return CartTile(
                  cartItem: app_data.cartItems[index],
                );
              },
            ),
          ),
          // Rodape Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CustomColors.customCardColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              ],
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Total do Carrinho',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.customDarkColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    utilsServices
                        .priceToCurrency(obterTotalPedido(app_data.cartItems)),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.customSwatchColor,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: CustomColors.customSwatchColor,
                  ),
                  onPressed: () {},
                  child: const Text('Fechar pedido'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

double obterTotalPedido(List<CartItemModel> cartItems) {
  double total = 0.0;
  for (var item in cartItems) {
    total += item.totalPrice;
  }
  return total;
}
