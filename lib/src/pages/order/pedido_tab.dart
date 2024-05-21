import 'package:flutter/material.dart';
import 'package:quitandaapp/src/pages/components/custom_app_bar.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/config/app_data.dart' as app_data;
import 'package:quitandaapp/src/pages/order/components/pedido_tile.dart';

class PedidoTab extends StatelessWidget {
  const PedidoTab({super.key});

  CustomAppBar appBar() => CustomAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.info,
              color: CustomColors.customCardColor,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemBuilder: (_, index) {
          return PedidoTile(pedidosModel: app_data.pedidos[index]);
        },
        itemCount: app_data.pedidos.length,
      ),
    );
  }
}
