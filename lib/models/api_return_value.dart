part of 'model.dart';

enum httpMethod { GET, POST }

class ApiReturnValue<T> {
  final T? value;
  final String? message;
  final bool? unauthorized;
  final Map<String, dynamic>? exception;

  ApiReturnValue({
    this.message,
    this.value,
    this.unauthorized,
    this.exception,
  });
}

Future<Map<String, dynamic>> ApiExec(
  String pagename,
  httpMethod method, {
  dynamic param,
  Map<String, dynamic>? queryParameter,
  http.Client? client,
}) async {
  int nomor = 0;
  try {
    nomor = 1;
    client ??= http.Client();

    nomor = 2;
    String action = pagename;
    if (method == httpMethod.GET) {
      action += (param != null) ? ('/') + param.toString() : '';
    }
    // print("jobId: ${action}");

    nomor = 3;
    Uri url = (schemeURL == "http")
        ? Uri.http(baseURL, basePATH + action, queryParameter)
        //Uri.http(baseURL, basePATH + action, )
        : Uri.https(baseURL, basePATH + action, queryParameter);

    // Uri url = Uri(
    //   scheme: schemeURL,
    //   host: baseURL,
    //   path: basePATH + '/v1/job',
    // );

    nomor = 3;
    Map<String, String>? headers = {
      "Content-Type": "application/json",
      "Authorization": (await getAuthorizationSession()).toString(),
      //"${await getAuthorizationSession()}",
      headerWarning: headerWarning,
    };

    nomor = 4;
    dynamic request;

    if (method == httpMethod.GET) {
      nomor = 5;
      request = await client.get(
        url,
        headers: headers,
      );
    } else if (method == httpMethod.POST) {
      nomor = 6;
      request = await client.post(
        url,
        headers: headers,
        body: param,
      );
    }

    // print("id: ${url} ${request.statusCode}");

    nomor = 7;
    var result = jsonDecode(request.body);

    if (request.statusCode == 401) {
      nomor = 8;
      return {
        "status": false,
        "message": unauthorized,
        "exception": {"status": false}
      };
    }
    if (request.statusCode == 500) {
      nomor = 9;
      return {
        "status": false,
        "message": "Kesalahan server saat memproses permintaan Anda",
        "exception": {
          "status": true,
          "image": "internal_server_error.png",
          "title": "500",
          "subTitle": "Internal Server Error",
          "msg": "Kesalahan server saat memproses permintaan Anda",
          "button": "Refresh"
        },
      };
    }
    if (request.statusCode == 400) {
      nomor = 10;
      return {
        "status": false,
        "message": result['message'].toString(),
        "exception": {"status": false},
      };
    }
    if (request.statusCode != 200) {
      nomor = 99;
      return {
        "status": false,
        "message":
            result['message'].toString() + (" err.no:") + nomor.toString(),
        "exception": {"status": false},
      };
    }

    // client.close();
    nomor = 100;
    return {"status": true, "data": result};
  } on SocketException {
    return {
      "status": false,
      "message": "Tidak ditemukan koneksi Internet",
      "exception": {
        "image": "no_connection.png",
        "title": "Tidak Ada Koneksi",
        "subTitle": "Tidak ditemukan koneksi Internet",
        "msg": "Silahkan periksa koneksi internet Anda",
        "button": "Refresh"
      },
    };
    // return ApiReturnValue(message: "No Internet Connection");
  } on HttpException {
    return {
      "status": false,
      "message": "Halaman yang Anda tuju tidak tersedia",
      "exception": {
        "image": "error_others.png",
        "title": "404",
        "subTitle": "Maaf",
        "msg": "Halaman yang Anda tuju tidak tersedia",
        "button": "Kembali"
      },
    };
    // return ApiReturnValue(message: "Couldn't find the post");
  } on FormatException {
    return {
      "status": false,
      "message": 'Bad response format',
      "exception": {
        "image": "error_others.png",
        "title": "404",
        "subTitle": "Bad response format",
        "msg": "Terjadi kesalahan saat memproses permintaan Anda",
        "button": "Kembali"
      },
    };
    // return ApiReturnValue(message: "Bad response format");
  } catch (e) {
    return {
      "status": false,
      "message": ("catch: ") + e.toString() + (" ") + nomor.toString(),
      "exception": {
        "image": "error_others.png",
        "title": "Maaf",
        "subTitle": "Terdapat kesalahan pada aplikasi",
        "msg": "Silahkan mulai ulang aplikasi atau hubungi Administrator",
        "button": ""
      },
    };
    // return ApiReturnValue(message: "catch: " + e.toString());
  }
}
