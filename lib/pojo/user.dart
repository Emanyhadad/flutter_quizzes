class User {
  int? id;
  String? name;
  String? email;
  String? photo;
  String? phone;
  String? active;
  String? token;
  String? password;

  User(
      {this.id,
      this.name,
      this.email,
      this.photo,
      this.phone,
      this.active,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    phone = json['phone'];
    active = json['active'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['phone'] = this.phone;
    data['active'] = this.active;
    data['token'] = this.token;
    return data;
  }

  Map<String, dynamic> toJsonRegister() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;

    return data;
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, photo: $photo,'
        ' phone: $phone, active: $active, token: $token, password: $password}';
  }
}
