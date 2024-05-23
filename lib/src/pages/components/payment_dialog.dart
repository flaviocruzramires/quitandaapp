import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/models/pedido_model.dart';
import 'package:quitandaapp/src/services/utils_services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  PaymentDialog({
    super.key,
    required this.pedidosModel,
  });

  final PedidosModel pedidosModel;

  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Column(
        children: [
          Text(
            'Pagamento com Pix',
          ),
        ],
      ),
      content: SizedBox(
        height: 500,
        width: 300,
        child: Expanded(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'Escanear o QRCode',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.customSwatchColor,
                      ),
                    ),
                    QrImageView(
                      data: pedidosModel.copyAndPasteQrCode,
                      version: QrVersions.auto,
                      size: 180.0,
                    ),
                  ],
                ),
              ),
              const Divider(),
              Text(
                'Vencimento: ${utilsServices.formatDateTime(pedidosModel.vencimentoQrCode.toString())} ',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Text(
                    'Pedido: ${pedidosModel.id.toString()} - ${utilsServices.formatDate(pedidosModel.createdDateTime.toString())}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CustomColors.customDarkColor,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                  ),
                  Text('Cliente: ${pedidosModel.cliente}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.customDarkColor,
                        fontSize: 18,
                      )),
                  Text(
                    'Total Pedido: ${utilsServices.priceToCurrency(pedidosModel.total)} ',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: CustomColors.customSwatchColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pix_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Pix - Copie e Cole',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
