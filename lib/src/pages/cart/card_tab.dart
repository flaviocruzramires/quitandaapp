import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitandaapp/src/config/app_data.dart' as app_data;
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/models/carrinho_controller.dart';
import 'package:quitandaapp/src/models/cart_item_model.dart';
import 'package:quitandaapp/src/pages/components/cart_tile.dart';
import 'package:quitandaapp/src/pages/components/custom_app_bar.dart';
import 'package:quitandaapp/src/pages/components/custom_text_field.dart';
import 'package:quitandaapp/src/services/utils_services.dart';

class CardTab extends StatefulWidget {
  const CardTab({super.key});

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

  void removerItemFromCard(CartItemModel cartItem) {
    setState(() {
      app_data.cartItems.remove(cartItem);
    });
  }

  double obterTotalPedido(List<CartItemModel> cartItems) {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.totalPrice!;
    }
    return total;
  }

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: GetX<CarrinhoControler>(
        init: CarrinhoControler(),
        initState: (_) {},
        builder: (carrinhoControler) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(2),
                    itemCount: carrinhoControler.carrinho.length,
                    //itemCount: app_data.cartItems.length,
                    itemBuilder: (_, index) {
                      return CartTile(
                        cartItem: carrinhoControler.carrinho[index],
                        remove: removerItemFromCard,
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
                      CustomTextField(
                        textoHint: 'Nome do Cliente',
                        textoLabel: 'Cliente',
                        iconPrefixo: Icon(
                          Icons.person_outline_outlined,
                          color: CustomColors.customDarkColor,
                        ),
                        controller: nameController,
                      ),
                      Text(
                        'Total do Carrinho',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customDarkColor,
                        ),
                      ),
                      Text(
                        UtilsServices.priceToCurrency(
                          obterTotalPedido(app_data.cartItems),
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ]);
        },
      ),
    );
  }

  Future<bool?> mostrarDialogo() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Confirmar pedido'),
          content: const Text('Deseja realmente concluir o pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}
