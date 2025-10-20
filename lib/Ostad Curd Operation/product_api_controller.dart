import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/product_model.dart';
import 'utils/url.dart';

class ProductApiController {
  List<ProductData> productStore = [];

  //Fetch
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

  //add /Create
  Future<bool> addProduct(ProductData product) async {
    try {
      final response = await http.post(
        Uri.parse(UrlAll.createProduct),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(product.toJson()),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['status'] == 'success';
      }
      return false;
    } catch (e) {
      print("Error creating product: $e");
      return false;
    }
  }


  //Update
  Future<bool> UpdateProduct(ProductData product) async {
    try {
      final response = await http.post(
        Uri.parse(UrlAll.updateProduct(product.id!)),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(product.toJson()),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['status'] == 'success';
      }
      return false;
    } catch (e) {
      print("Error creating product: $e");
      return false;
    }
  }

  //dellet

  Future<bool> deletProduct(String id) async {
    final response = await http.get(Uri.parse(UrlAll.deleteProduct(id)));
    if (response.statusCode == 200) {
      final responceBody = jsonDecode(response.body);
      if (responceBody['status'] == 'success') {
        return true;
      }
    }
    return false;
  }

}
