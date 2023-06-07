// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int? id;
  String email;
  int? number;
  String password;
  User({
    this.id,
    required this.email,
    this.number,
    required this.password,
  });

  User copyWith({
    int? id,
    String? email,
    int? number,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      number: number ?? this.number,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'number': number,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] as String,
      number: map['number'] != null ? map['number'] as int : null,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, email: $email, number: $number, password: $password)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.number == number &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^ email.hashCode ^ number.hashCode ^ password.hashCode;
  }
}
