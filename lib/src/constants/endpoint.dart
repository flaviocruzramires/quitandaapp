abstract class Endpoint {
  static const String baseUrl = 'https://parseapi.back4app.com/functions';

  static const String singin = '$baseUrl/login';
  static const String singup = '$baseUrl/singup';
  static const String validateToken = '$baseUrl/validate-token';
  static const String resetPassword = '$baseUrl/reset-password';
  static const String getAllCategories = '$baseUrl/get-category-list';
  static const String getAllProducts = '$baseUrl/get-product-list';
}
