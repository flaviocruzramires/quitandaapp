import 'package:get/get.dart';
import 'package:quitandaapp/src/constants/storage_keys.dart';
import 'package:quitandaapp/src/models/user_model.dart';
import 'package:quitandaapp/src/pages/auth/repository/auth_repository.dart';
import 'package:quitandaapp/src/pages/auth/result/auth_result.dart';
import 'package:quitandaapp/src/pages_routes/app_pages.dart';
import 'package:quitandaapp/src/services/storage_local_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLogged = false.obs;

  final AuthRepository authRepository = AuthRepository();

  final StorageLocalServices storageLocalServices = StorageLocalServices();

  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  Future<void> validateToken() async {
    Future<String?> token =
        storageLocalServices.getLocalData(key: StorageKeys.token);

    final AuthResult result =
        await authRepository.validateToken(token as String);

    result.when(
      success: (user) {
        this.user = user;
        isLogged.value = true;
        saveTokenAndProccedToHome();
      },
      error: (message) {
        isLogged.value = false;
        singOut();
      },
    );
    update();
  }

  Future<void> singOut() async {
    user = UserModel();
    isLogged.value = false;
    await storageLocalServices.removeLocalData(key: StorageKeys.token);
    update();

    Get.offNamed(AppPagesRoutes.signIn);
  }

  Future<void> singIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    final AuthResult resultado = await authRepository.singIn(
      email: email,
      password: password,
    );

    resultado.when(
      success: (user) {
        isLogged.value = true;
        isLoading.value = false;

        saveTokenAndProccedToHome();
      },
      error: (message) {
        isLoading.value = false;
      },
    );
    update();
  }

  void saveTokenAndProccedToHome() {
    storageLocalServices.saveLocalData(
      key: StorageKeys.token,
      value: user.token!,
    );
    Get.offAllNamed(AppPagesRoutes.home);
  }
}
