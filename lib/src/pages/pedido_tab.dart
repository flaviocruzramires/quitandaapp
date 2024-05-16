import 'package:flutter/material.dart';
import 'package:quitandaapp/src/pages/components/custom_app_bar.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

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
        body: const Center(
          child: Text('Pedidos Tab'),
        ));
  }
}
