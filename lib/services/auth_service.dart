part of 'service.dart';

class AuthService {
  static String action = "/v1/auth";

  static Future<ApiReturnValue<Auth>> Login(
    String username,
    String password,
  ) async {
    var result = await ApiExec(
      action + ('/login'),
      httpMethod.POST,
      param: jsonEncode(
        <String, String>{
          "username": username,
          "password": password,
        },
      ),
    );

    if (result['status']) {
      // print(result['data']);
      Auth value = Auth.fromJson(result['data']);
      setAuthorizationSession(value);
      return ApiReturnValue(value: value);
    } else {
      return ApiReturnValue(
        message: (result['message'] == 'unauthorized')
            ? "Username tidak terdaftar atau Password salah!"
            : result['message'],
        exception: {"status": false},
      );
    }
  }

  static Future<ApiReturnValue<Auth>> RefreshToken() async {
    var result = await ApiExec(
      action + ('/refresh'),
      httpMethod.GET,
    );

    if (result['status']) {
      Auth value = Auth.fromJson(result['data']);
      setAuthorizationSession(value);
      return ApiReturnValue(value: value);
    } else {
      if (result['message'] == unauthorized) {
        return ApiReturnValue(unauthorized: true);
      }
      return ApiReturnValue(
        message: result['message'],
        exception: result['exception'],
      );
    }
  }

  static Future<ApiReturnValue<User>> Profile() async {
    var result = await ApiExec(action + ('/profile'), httpMethod.GET);

    if (result['status']) {
      User value = User.fromJson(result['data']['data']);
      return ApiReturnValue(value: value);
    } else {
      if (result['message'] == unauthorized) {
        return ApiReturnValue(unauthorized: true);
      }
      return ApiReturnValue(
        message: result['message'],
        exception: result['exception'],
      );
    }
  }

  static Future<ApiReturnValue<String>> Logout() async {
    var result = await ApiExec(
      action + ('/logout'),
      httpMethod.GET,
    );

    if (result['status']) {
      destroyAllSession();
      return ApiReturnValue(value: result['data']['message']);
    } else {
      if (result['message'] == unauthorized) {
        return ApiReturnValue(unauthorized: true);
      }
      return ApiReturnValue(
        message: result['message'],
        exception: result['exception'],
      );
    }
  }

  // static Future<ApiReturnValue<Auth>> Login(String username, String password,
  //     {http.Client? client}) async {
  //   try {
  //     if (client == null) {
  //       client = http.Client();
  //     }

  //     Uri url;
  //     String path = '/v1/auth/login';
  //     if (schemeURL == "http")
  //       url = Uri.http(baseURL, basePATH + path);
  //     else
  //       url = Uri.https(baseURL, basePATH + path);
  //     // Uri url = Uri(
  //     //   scheme: schemeURL,
  //     //   host: baseURL,
  //     //   path: basePATH + '/v1/auth/login',
  //     // );

  //     var request = await client.post(
  //       url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         headerWarning: "true",
  //       },
  //       body: jsonEncode(
  //         <String, String>{
  //           "username": username,
  //           "password": password,
  //         },
  //       ),
  //     );

  //     var result = jsonDecode(request.body);
  //     if (request.statusCode != 200) {
  //       return ApiReturnValue(message: result['message']);
  //     }

  //     // Auth.token = result['access_token'];
  //     Auth value = Auth.fromJson(result);
  //     setAuthorizationSession(value);
  //     return ApiReturnValue(value: value);
  //   } on SocketException {
  //     return ApiReturnValue(message: "No Internet Connection");
  //   } on HttpException {
  //     return ApiReturnValue(message: "Couldn't find the post");
  //     // } on FormatException {
  //     //   return ApiReturnValue(message: "Bad response format");
  //   } catch (e) {
  //     print(e.toString());
  //     return ApiReturnValue(message: "catch: " + e.toString());
  //   }
  // }
}
