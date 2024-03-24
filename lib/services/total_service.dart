part of 'service.dart';

class TotalService {
  static String action = "/v1/total";

  static Future<ApiReturnValue<Total>> ListData() async {
    var result = await ApiExec(
      action,
      httpMethod.GET,
      // param: company_id.toString(),
    );

    if (result['status']) {
      Total value = Total.fromJson(result['data']['data']);
      return ApiReturnValue(value: value);
    } else {
      if (result['message'] == unauthorized) {
        return ApiReturnValue(unauthorized: true);
      }
      return ApiReturnValue(message: result['message']);
    }
  }
}
