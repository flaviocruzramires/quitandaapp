import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/models/cart_item_model.dart';
import 'package:quitandaapp/src/models/pedido_model.dart';
import 'package:quitandaapp/src/pages/components/payment_dialog.dart';
import 'package:quitandaapp/src/pages/order/components/pedido_status_widget.dart';
import 'package:quitandaapp/src/services/utils_services.dart';

class PedidoTile extends StatelessWidget {
  PedidoTile({super.key, required this.pedidosModel});

  PedidosModel pedidosModel;

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
          initiallyExpanded: pedidosModel.status == 'pending_payment',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Pedido: ${pedidosModel.id}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    UtilsServices.formatDateTime(
                      pedidosModel.createdDateTime.toIso8601String(),
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Cliente: ${pedidosModel.cliente}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const Text(
                    '(67) 9 9999-9999',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 280,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ListView(
                      children: pedidosModel.itens.map(
                        (itempedido) {
                          return ObterItensDoPedido(
                            itempedido: itempedido,
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1.5,
                    width: 1.5,
                    color: Colors.grey.shade300,
                  ),
                  Expanded(
                    flex: 2,
                    child: PedidoStatusWidget(
                      status: pedidosModel.status,
                      qrdcodevenceu: pedidosModel.vencimentoQrCode.isBefore(
                        DateTime.now(),
                      ),
                    ),
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
                      'Total: ${UtilsServices.priceToCurrency(
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
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Visibility(
                visible: pedidosModel.status == 'pending_payment',
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: CustomColors.customSwatchColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return PaymentDialog(pedidosModel: pedidosModel);
                      },
                    );

                    //exibirDialogoQRCode(context, pedidosModel);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.pix,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Gerar QRCode',
                        style: TextStyle(
                          color: CustomColors.customCardColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double obterTotalPedido(List<CartItemModel> cartItems) {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.totalPrice!;
    }
    return total;
  }
}

class ObterItensDoPedido extends StatelessWidget {
  const ObterItensDoPedido({
    super.key,
    required this.itempedido,
  });

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
            ' ${itempedido.quantity.toString()} ${itempedido.item!.unidadeMedida} ',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                itempedido.item!.itemName,
                style: const TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Text(
            UtilsServices.priceToCurrency(itempedido.totalPrice!),
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
