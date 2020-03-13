import 'dart:convert';

import 'package:huntapp/app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = 'http://hunt-api.vssdev.com.br/api';

  Future<List<Product>> getPoducts() async {
    var response = await http.get("$baseUrl/products");
    var data = json.decode(response.body)["docs"] as List;

    return data.map((product) {
      return Product.fromJson(product);
    }).toList();
  }

  Future<Product> getProductById(String id) async {
    var response = await http.get('$baseUrl/products/$id');
    var data = json.decode(response.body);

    return Product.fromJson(data);
  }

}
