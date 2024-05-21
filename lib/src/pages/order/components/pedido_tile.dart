import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quitandaapp/src/models/cart_item_model.dart';

import 'package:quitandaapp/src/models/pedido_model.dart';
import 'package:quitandaapp/src/services/utils_services.dart';

class PedidoTile extends StatelessWidget {
  PedidoTile({super.key, required this.pedidosModel});

  PedidosModel pedidosModel;

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Pedido: ${pedidosModel.id}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    utilsServices.formatDateTime(
                      pedidosModel.createdDateTime.toIso8601String(),
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Text(
                pedidosModel.cliente,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            const Divider(
              thickness: 1.5,
              height: 1.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ListView(
                      children: pedidosModel.itens.map(
                        (itempedido) {
                          return ObterItensDoPedido(
                            utilsServices: utilsServices,
                            itempedido: itempedido,
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Text('a'),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1.5,
              height: 1.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text('Endereço rua nonononononon'),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Total: ${utilsServices.priceToCurrency(
                        obterTotalPedido(pedidosModel.itens),
                      )}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Ver mais'),
            )
          ],
        ),
      ),
    );
  }

  double obterTotalPedido(List<CartItemModel> cartItems) {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.totalPrice;
    }
    return total;
  }
}

class ObterItensDoPedido extends StatelessWidget {
  const ObterItensDoPedido({
    super.key,
    required this.utilsServices,
    required this.itempedido,
  });

  final UtilsServices utilsServices;
  final CartItemModel itempedido;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 2.0,
      ),
      child: Row(
        children: [
          Text(
            ' ${itempedido.quantity.toString()} ${itempedido.item.unidadeMedida} ',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          Expanded(
            child: Text(
              itempedido.item.itemName,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            utilsServices.priceToCurrency(itempedido.totalPrice),
            textAlign: TextAlign.right,
          )
        ],
      ),
    );
  }
}
