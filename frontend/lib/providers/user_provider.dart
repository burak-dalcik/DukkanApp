import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kirt_apideneme/models/user.dart';
import 'package:kirt_apideneme/services/user_service.dart';

// Kullanıcı listesini sağlayan FutureProvider
final userListProvider = FutureProvider<List<UserResponse>>((ref) async {
  final userService = ref.watch(userServiceProvider);
  return userService.fetchUsers();
});

// UserService sağlayıcısı
final userServiceProvider = Provider((_) => UserService());
