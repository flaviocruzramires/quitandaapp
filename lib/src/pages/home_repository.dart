import 'package:quitandaapp/src/constants/endpoint.dart';
import 'package:quitandaapp/src/models/category_model.dart';
import 'package:quitandaapp/src/models/item_model.dart';
import 'package:quitandaapp/src/pages/home_result.dart';
import 'package:quitandaapp/src/services/http_manager.dart';
import 'package:quitandaapp/src/services/utils_services.dart';

class HomeRepository {
  final HttpManager httpManager = HttpManager();

  Future<HomeResult<CategoryModel>> getAllCategories() async {
    final result = await httpManager.restRequest(
      url: Endpoint.getAllCategories,
      method: HttpMethods.post,
      headers: UtilsServices.obterHeaders(withKeyToken: false),
    );

    if (result['result'] != null) {
      List<CategoryModel> data =
          (List<Map<String, dynamic>>.from(result['result']))
              .map(CategoryModel.fromJson)
              .toList();

      return HomeResult<CategoryModel>.success(data);
    } else {
      return HomeResult.error(result['error']);
    }
  }

  Future<HomeResult<ItemModel>> getAllProducts(
      Map<String, dynamic> body) async {
    final result = await httpManager.restRequest(
      url: Endpoint.getAllProducts,
      method: HttpMethods.post,
      headers: UtilsServices.obterHeaders(withKeyToken: false),
      body: body,
    );

    if (result['result'] != null) {
      List<ItemModel> data = (List<Map<String, dynamic>>.from(result['result']))
          .map(ItemModel.fromJson)
          .toList();

      return HomeResult<ItemModel>.success(data);
    } else {
      return HomeResult.error(result['error']);
    }
  }
}
