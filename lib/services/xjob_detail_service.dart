// part of 'service.dart';

// class JobDetailService {
//   static Future<ApiReturnValue<JobDetail>> DetailData(int id,
//       {http.Client? client}) async {
//     try {
//       if (client == null) client = http.Client();

//       Uri url;
//       String path = '/v1/job/' + id.toString();
//       if (schemeURL == "http")
//         url = Uri.http(baseURL, basePATH + path);
//       else
//         url = Uri.https(baseURL, basePATH + path);

//       var request = await client.get(
//         url,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "${await getAuthorizationSession()}",
//           headerWarning: headerWarning,
//         },
//       );

//       var result = jsonDecode(request.body);
//       if (request.statusCode != 200) {
//         return ApiReturnValue(message: result['message']);
//       }

//       JobDetail value = JobDetail.fromJson(result['data']);
//       return ApiReturnValue(value: value);
//     } on SocketException {
//       return ApiReturnValue(message: "No Internet Connection");
//     } on HttpException {
//       return ApiReturnValue(message: "Couldn't find the post");
//     } on FormatException {
//       return ApiReturnValue(message: "Bad response format");
//     } catch (e) {
//       return ApiReturnValue(message: "catch: " + e.toString());
//     }
//   }
// }
