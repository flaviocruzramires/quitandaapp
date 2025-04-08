import 'package:get/get.dart';
import 'package:quitandaapp/src/models/category_model.dart';
import 'package:quitandaapp/src/models/item_model.dart';
import 'package:quitandaapp/src/pages/home_repository.dart';
import 'package:quitandaapp/src/pages/home_result.dart';
import 'package:quitandaapp/src/services/utils_services.dart';

class HomeController extends GetxController {
  final repository = HomeRepository();

  bool isLoading = false;

  List<CategoryModel> allCategories = [];

  CategoryModel? currentCategory;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();
  }

  Future<void> getAllCategories() async {
    setLoading(true);
    final HomeResult<CategoryModel> result =
        await repository.getAllCategories();
    result.when(
      success: (data) {
        allCategories.assignAll(data);

        if (allCategories.isEmpty) return;

        selectCategory(allCategories.first);
      },
      error: (message) {
        UtilsServices.showToast(message: message, isError: true);
      },
    );

    setLoading(false);
  }

  Future<void> getAllProducts(Map<String, dynamic> body) async {
    setLoading(true);
    final HomeResult<ItemModel> result = await repository.getAllProducts(body);
    result.when(
      success: (data) {
        selectCategory.items.assignAll(data);
      },
      error: (message) {
        UtilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
    setLoading(false);
  }
}
