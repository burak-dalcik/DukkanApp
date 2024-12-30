import 'dart:convert';

import 'package:kirt_apideneme/models/user.dart';
import 'package:http/http.dart' as http;
abstract class IUserRepository{
  Future<UserResponse> fetchUserList();
}
class UserRepository implements IUserRepository{
  final _host = "https://10.0.2.2:7222/api/Users";
  final Map<String, String> _headers ={
    "Accept": "application/json",
    "contect-type": "application/json",

  };
  @override
  Future<UserResponse> fetchUserList() async {
    var getAllUsersUrl = _host;
    var results = await http.get(Uri.parse(getAllUsersUrl), headers:  _headers);
    final jsonObject = json.decode(results.body);
    var response = UserResponse.fromJson(jsonObject);
    return response;

  }
}