import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/product_model.dart';
import 'utils/url.dart';

class ProductApiController {
  List<ProductData> productStore = [];

  Future fetchProduct() async {
    final response = await http.get(Uri.parse(UrlAll.readProduct));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final productModel = ProductModel.fromJson(data);
      productStore = productModel.data ?? [];
    } else {
      throw Exception("Failed to load products");
    }
  }
}
