import 'package:flutter/material.dart';
import 'package:kirt_apideneme/services/user_service.dart';
import 'package:kirt_apideneme/models/user.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final UserService _userService = UserService();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Yap'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                focusNode: _usernameFocus,
                decoration: const InputDecoration(
                  labelText: 'Kullanıcı Adı',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Şifre',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _login(context);
                },
                child: const Text('Giriş'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    _usernameFocus.unfocus();
    _passwordFocus.unfocus();

    try {
      List<UserResponse> users = await _userService.fetchUsers();

      UserResponse authenticatedUser = users.firstWhere(
            (user) => user.name == username && user.password == password,
        orElse: () => UserResponse(
          userId: -1,
          name: '',
          password: '',
          address: '',
          phoneNumber: '',
        ),
      );

      if (authenticatedUser.userId != -1) {
        Navigator.pushNamed(context, '/AnaSayfa');
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Hata'),
            content: const Text('Geçersiz kullanıcı adı veya şifre.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Tamam'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Hata'),
          content: Text('API\'den veri alınamıyor: $e'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tamam'),
            ),
          ],
        ),
      );
    }
  }
}
