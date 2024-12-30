import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';


class PersonelPage extends StatefulWidget {
  const PersonelPage({super.key});

  @override
  _PersonelPageState createState() => _PersonelPageState();
}

class _PersonelPageState extends State<PersonelPage> {
  late Future<List<UserResponse>> futureUsers;
  UserService userService = UserService();

  @override
  void initState() {
    super.initState();
    futureUsers = userService.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personel Listesi'),
      ),
      body: FutureBuilder<List<UserResponse>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Personeller yüklenirken bir hata oluştu.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Hiç personel yok.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var user = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Adres: ${user.address}'),
                        Text('Telefon: ${user.phoneNumber}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
