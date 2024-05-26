import 'package:quitandaapp/src/models/cart_item_model.dart';

class PedidosModel {
  PedidosModel({
    required this.id,
    required this.createdDateTime,
    required this.vencimentoQrCode,
    required this.itens,
    required this.status,
    required this.copyAndPasteQrCode,
    required this.total,
    required this.cliente,
  });

  String id;
  DateTime createdDateTime;
  DateTime vencimentoQrCode;
  List<CartItemModel> itens;
  String status;
  String copyAndPasteQrCode;
  double total;
  String cliente;
}
