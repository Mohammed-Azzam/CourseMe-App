class UserModel {
  late String name;
  late String phone;
  late String email;
  late String uId;

  UserModel(
      {required this.uId,
        required this.name,
        required this.email,
        required this.phone,
      });

  UserModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'phone': phone,
    };
  }
}
