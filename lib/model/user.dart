import 'dart:convert';

class User {
  int id;
  String name;
  String email;
  String passowrd;
  String phone;
  String address;
  String apiToken;
  String role;
  String image;
  String createdAt;
  String updatedAt;
  int balance;
  int points;
  String code;

  

  User(
    this.id,
    this.name,
    this.email,
    this.passowrd,
    this.phone,
    this.address,
    this.apiToken,
    this.role,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.balance,
    this.points,
    this.code,
  );

  static User getAuthUser() {
    return null;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'role': role,
        'name': name,
        'code': code,
        'email': email,
        'phone': phone,
        'image': image,
        'points': points,
        'balance': balance,
        'address': address,
        'api_token': apiToken,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };

  User copyWith({
    int id,
    String name,
    String email,
    String passowrd,
    String phone,
    String address,
    String apiToken,
    String role,
    String image,
    String createdAt,
    String updatedAt,
    int balance,
    int points,
    String code,
  }) {
    return User(
      id ?? this.id,
      name ?? this.name,
      email ?? this.email,
      passowrd ?? this.passowrd,
      phone ?? this.phone,
      address ?? this.address,
      apiToken ?? this.apiToken,
      role ?? this.role,
      image ?? this.image,
      createdAt ?? this.createdAt,
      updatedAt ?? this.updatedAt,
      balance ?? this.balance,
      points ?? this.points,
      code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'passowrd': passowrd,
      'phone': phone,
      'address': address,
      'apiToken': apiToken,
      'role': role,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'balance': balance,
      'points': points,
      'code': code,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      map['id'],
      map['name'],
      map['email'],
      map['passowrd'],
      map['phone'],
      map['address'],
      map['apiToken'],
      map['role'],
      map['image'],
      map['createdAt'],
      map['updatedAt'],
      map['balance'],
      map['points'],
      map['code'],
    );
  }

  // String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.id == id &&
        o.name == name &&
        o.email == email &&
        o.passowrd == passowrd &&
        o.phone == phone &&
        o.address == address &&
        o.apiToken == apiToken &&
        o.role == role &&
        o.image == image &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.balance == balance &&
        o.points == points &&
        o.code == code;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        passowrd.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        apiToken.hashCode ^
        role.hashCode ^
        image.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        balance.hashCode ^
        points.hashCode ^
        code.hashCode;
  }

  @override
  String toString() {
    return 'User id: $id, name: $name, email: $email, passowrd: $passowrd, phone: $phone, address: $address, apiToken: $apiToken, role: $role, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, balance: $balance, points: $points, code: $code';
  }
}
