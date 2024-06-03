import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> singIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 20), () {
      isLoading.value = false;
    });
  }
}
