import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<List<ProductModel>> getRecommendedProductList() async {
    return await apiClient
        .getData("https://mvs.bslmeiyu.com/api/v1/products/recommended");
  }
}
