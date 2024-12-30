class UserResponse {
  final int userId;
  final String name;
  final String password;
  final String address;
  final String phoneNumber;

  UserResponse({
    required this.userId,
    required this.name,
    required this.password,
    required this.address,
    required this.phoneNumber,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      userId: json['userId'],
      name: json['name'],
      password: json['password'],
      address: json['address'],
      phoneNumber: json['phonenumber'],
    );
  }
}
