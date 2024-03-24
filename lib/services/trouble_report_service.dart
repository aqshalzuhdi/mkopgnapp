part of 'service.dart';

class TroubleReportService {
  static String action = "/v1/trouble-report";

  static Future<ApiReturnValue<List<TroubleReport>>> ListData(
      {int? page, int? limit}) async {
    var result = await ApiExec(
      action,
      httpMethod.GET,
      queryParameter: {
        "sort": "-id",
        "page": (page == null) ? "0" : page.toString(),
        "limit": (limit == null) ? "0" : limit.toString(),
      },
    );

    if (result['status']) {
      List<TroubleReport> value = (result['data']['data'] as Iterable)
          .map((e) => TroubleReport.fromJson(e))
          .toList();
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

  static Future<ApiReturnValue<String>> InsertData({
    required String companyId,
    required String date,
    required String receivedTime,
    required String responseTime,
    required String description,
    required String analysis,
    required String solutionMethodId,
    required String solutionTime,
  }) async {
    var result = await ApiExec(
      action,
      httpMethod.POST,
      param: jsonEncode(
        <String, String>{
          "company_id": companyId,
          "date": date,
          "received_time": receivedTime,
          "response_time": responseTime,
          "description": description,
          "analysis": analysis,
          "solution_method_id": solutionMethodId,
          "solution_time": solutionTime,
        },
      ),
    );

    if (result['status']) {
      String message = result['data']["message"];
      return ApiReturnValue(value: message);
    } else {
      if (result['message'] == unauthorized) {
        return ApiReturnValue(unauthorized: true);
      }
      return ApiReturnValue(message: result['message']);
    }
  }
}
