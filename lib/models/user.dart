part of 'model.dart';

class User extends Equatable {
  final int? id;
  final int? operatingAreaId;
  final String? nip;
  final String? name;
  final String? username;
  final int? role;
  final String? email;
  final String? signatureImage;
  final String? phoneNumber;
  final String? createdAt;
  final String? updatedAt;

  const User({
    this.id,
    this.operatingAreaId,
    this.nip,
    this.name,
    this.username,
    this.role,
    this.email,
    this.signatureImage,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'],
        operatingAreaId: data['operating_area_id'],
        nip: data['nip'],
        name: data['name'],
        username: data['username'],
        role: data['role'],
        email: data['email'],
        signatureImage: data['signature_image'],
        phoneNumber: data['phone_number'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  User copyWith({
    int? id,
    int? operatingAreaId,
    String? nip,
    String? name,
    String? username,
    int? role,
    String? email,
    String? signatureImage,
    String? phoneNumber,
    String? createdAt,
    String? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      operatingAreaId: operatingAreaId ?? this.operatingAreaId,
      nip: nip ?? this.nip,
      name: name ?? this.name,
      username: username ?? this.username,
      role: role ?? this.role,
      email: email ?? this.email,
      signatureImage: signatureImage ?? this.signatureImage,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        operatingAreaId,
        nip,
        name,
        username,
        role,
        email,
        signatureImage,
        phoneNumber,
        createdAt,
        updatedAt,
      ];
}

User mockUser = const User(
  id: 1,
  operatingAreaId: 1,
  nip: "123456",
  name: "aqshal",
  username: "aqshal",
  role: 1,
  email: "aqshal@gmail.com",
  signatureImage: "default.png",
  phoneNumber: "6281259304885",
  createdAt: "2023-08-07T15:10:39.000000Z",
  updatedAt: "2023-08-07T15:10:39.000000Z",
);
