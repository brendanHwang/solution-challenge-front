class UserModel {
  String id;
  String name;
  String email;
  String password;
  String passwordApprove;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      this.password = '',
      this.passwordApprove = ''});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      passwordApprove: json['passwordApprove'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'passwordApprove': passwordApprove,
    };
  }
}
