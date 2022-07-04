import 'dart:developer';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    final list = await recommendedProductRepo.getRecommendedProductList();

    if (list != null) {
      _recommendedProductList = [];

      _recommendedProductList.addAll(list);

      _isLoaded = true;
      update();
    } else {
      log("could not get recomended products");
    }
  }
}
