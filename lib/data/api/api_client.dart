import 'dart:convert';
import 'dart:developer';
import 'package:food_delivery/models/products_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  String? token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = "";
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<List<ProductModel>> getData(
    String uri,
  ) async {
    try {
      final response = await http.get(Uri.parse(uri));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      return Product.fromJson(extractedData).products;
    } catch (e) {
      log(e.toString());
      log("++++++++++++");
      throw (e);
      //return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
