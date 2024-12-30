import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  final String apiUrl = "http://10.0.2.2:5137/api/users"; // Emülatörde 10.0.2.2 kullanılır.

  Future<List<UserResponse>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      List<UserResponse> users = data.map((json) => UserResponse.fromJson(json)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
