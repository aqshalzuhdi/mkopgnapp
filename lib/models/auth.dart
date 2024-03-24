part of 'model.dart';

class Auth extends Equatable {
  final int? id;
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  // static String? token;

  Auth({
    this.id,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  factory Auth.fromJson(Map<String, dynamic> data) => Auth(
        id: data['id'],
        accessToken: data['access_token'],
        tokenType: data['token_type'],
        expiresIn: data['expires_in'],
      );

  Auth copyWith({
    int? id,
    String? accessToken,
    String? tokenType,
    int? expiresIn,
  }) {
    return Auth(
      id: id ?? this.id,
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      expiresIn: expiresIn ?? this.expiresIn,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, accessToken, tokenType, expiresIn];
}

// class Logout extends Equatable {
//   final String 
// }