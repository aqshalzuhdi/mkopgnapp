part of 'shared.dart';

var sessionManager = SessionManager();

Future<void> setAuthorizationSession(Auth auth) async {
  await sessionManager.set(
      'authorization', auth.tokenType! + (" ") + auth.accessToken!);
}

Future<dynamic> getAuthorizationSession() async {
  return await sessionManager.get('authorization');
}

Future<void> destroyAllSession() async {
  await sessionManager.destroy();
}
