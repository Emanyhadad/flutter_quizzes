class User {
  int? id;
  String? name;
  String? email;
  String? photo;
  String? phone;
  String? active;
  String? token;
  String? password;

  User({
    this.id,
    this.name,
    this.email,
    this.photo,
    this.phone,
    this.active,
    this.token,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      photo: json['photo'],
      phone: json['phone'],
      active: json['active'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'name': name,
      'email': email,
      'photo': photo,
      'phone': phone,
      'active': active,
      'token': token,
    };
    return data;
  }

  Map<String, dynamic> toJsonRegister() {
    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };

    if (id != null) {
      data['id'] = id;
    }

    return data;
  }


  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, photo: $photo,'
        ' phone: $phone, active: $active, token: $token, password: $password}';
  }
}
