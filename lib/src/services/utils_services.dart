import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/constants/storage_keys.dart';

abstract class UtilsServices {
  // Armazenamento Local

  static String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  static String formatDate(String dateTime) {
    initializeDateFormatting();
    DateTime now = DateTime.parse(dateTime);
    return DateFormat('dd/MM/yyyy').format(now);
  }

  static String formatDateTime(String dateTime) {
    DateTime now = DateTime.parse(dateTime);
    return DateFormat('dd/MM/yyyy - HH:mm').format(now);
  }

  static void showToast({
    required String message,
    bool isError = false,
  }) {
    final FToast fToast = FToast();

    Widget customToast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: isError ? Colors.red : CustomColors.customSwatchColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isError ? Icons.info_outline : Icons.check,
            color: Colors.white,
          ),
          const SizedBox(width: 12.0),
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
    fToast.showToast(
      child: customToast,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 3),
    );
  }

  static void showSnackbar({
    required BuildContext context,
    required String message,
    IconData? icon = Icons.error,
    bool isError = false,
  }) {
    IconSnackBar.show(
      context,
      label: message,
      snackBarType: isError ? SnackBarType.fail : SnackBarType.success,
      snackBarStyle: SnackBarStyle(
        backgroundColor: isError
            ? CustomColors.customContrastColor
            : CustomColors.customSwatchColor,
        iconColor: Colors.white,
        maxLines: 2,
      ),
    );
  }

  static Map<String, dynamic> obterHeaders({
    bool withKeyToken = false,
  }) {
    if (withKeyToken) {
      return {
        StorageKeys.contentType: 'application/json',
        StorageKeys.xParseApplicationId:
            'wK7GcEjr2V4br5q5mlR1kybQ5dvxMFDX0qtE1d6Y',
        StorageKeys.xParseRestApiKey:
            '2kahi62fkWePLWAwC7k8aMrtQkobogcgkruMxbeB',
        StorageKeys.xParseSessionToken: 'r:f8cff95d829930eebd82c8d2770197e3',
      };
    } else {
      return {
        StorageKeys.contentType: 'application/json',
        StorageKeys.xParseApplicationId:
            'wK7GcEjr2V4br5q5mlR1kybQ5dvxMFDX0qtE1d6Y',
        StorageKeys.xParseRestApiKey:
            '2kahi62fkWePLWAwC7k8aMrtQkobogcgkruMxbeB',
      };
    }
  }
}
