import 'package:get/get.dart';

class ValueController extends GetxController {
  RxString definedValue = ''.obs;

  RxBool isLoading = false.obs;

  //Rx

  Future<void> setValue(String newValue) async {
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 1500), () {
      isLoading.value = false;
    });

    definedValue.value = newValue;
  }
}
