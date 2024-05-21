import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:quitandaapp/src/models/cart_item_model.dart';

class UtilsServices {
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  String formatDate(String dateTime) {
    initializeDateFormatting();
    DateTime now = DateTime.parse(dateTime);
    return DateFormat('dd/MM/yyyy').format(now);
  }

  String formatDateTime(String dateTime) {
    DateTime now = DateTime.parse(dateTime);
    return DateFormat('dd/MM/yyyy - HH:mm').format(now);
  }
}
