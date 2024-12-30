
/*import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:5137/api';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/Products'));

    if (response.statusCode == 200) {
      return Product.fromJsonList(json.decode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }
}
*/