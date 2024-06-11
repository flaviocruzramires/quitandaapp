import 'package:quitandaapp/src/constants/endpoint.dart';
import 'package:quitandaapp/src/constants/storage_keys.dart';
import 'package:quitandaapp/src/models/user_model.dart';
import 'package:quitandaapp/src/pages/auth/repository/auth_errors.dart';
import 'package:quitandaapp/src/pages/auth/result/auth_result.dart';
import 'package:quitandaapp/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager httpManager = HttpManager();

  // ============================================
  //  Body
  // ============================================
  Map<dynamic, dynamic> obterBody({
    required String email,
    required String password,
  }) {
    return {
      'email': email,
      'password': password,
    };
  }

  // ============================================
  //  Headers
  // ============================================
  Map<String, dynamic> obterHeaders({
    bool withKeyToken = false,
  }) {
    if (withKeyToken) {
      return {
        StorageKeys.contentType: 'application/json',
        StorageKeys.xParseApplicationId:
            'wK7GcEjr2V4br5q5mlR1kybQ5dvxMFDX0qtE1d6Y',
        StorageKeys.xParseRestApiKey:
            '2kahi62fkWePLWAwC7k8aMrtQkobogcgkruMxbeB',
        StorageKeys.xParseSessionToken: 'r:8a815e8dd637f3a966f50ec60fccc9c4',
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

  // ============================================
  // Metodo de login
  // ============================================
  Future<AuthResult> singIn({
    required String email,
    required String password,
  }) async {
    final result = await httpManager.restRequest(
      url: Endpoint.singin,
      method: HttpMethods.post,
      body: obterBody(
        email: email,
        password: password,
      ),
      headers: obterHeaders(),
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(
        authErrorsString(
          result['error'],
        ),
      );
    }
  }

  // ============================================
  // Validar Token
  // ============================================
  Future<AuthResult> validateToken(String token) async {
    final result = await httpManager.restRequest(
      url: Endpoint.validateToken,
      method: HttpMethods.post,
      headers: obterHeaders(withKeyToken: true),
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(
        authErrorsString(
          result['error'],
        ),
      );
    }
  }
}
