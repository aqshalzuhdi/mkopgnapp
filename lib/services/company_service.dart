part of 'service.dart';

class CompanyService {
  static String action = '/v1/company';

  static Future<ApiReturnValue<List<Company>>> ListDataAvailable() async {
    var result = await ApiExec(action + '/available', httpMethod.GET);

    if (result['status']) {
      List<Company> value = (result['data']['data'] as Iterable)
          .map((e) => Company.fromJson(e))
          .toList();
      return ApiReturnValue(value: value);
    } else {
      if (result['message'] == unauthorized) {
        return ApiReturnValue(unauthorized: true);
      }
      return ApiReturnValue(message: result['message']);
    }
  }
}
