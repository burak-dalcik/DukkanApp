import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductApiService {
  static const String baseUrl = 'http://10.0.2.2:5137/api';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/Products'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> fetchProduct(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/Products/$id'));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<bool> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Products'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );

    return response.statusCode == 201;
  }

  Future<bool> updateProduct(Product product) async {
    final response = await http.put(
      Uri.parse('$baseUrl/Products/${product.productId}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Failed to update product: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
  }
}
