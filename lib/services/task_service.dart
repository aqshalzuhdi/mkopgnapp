part of 'service.dart';

class TaskService {
  static String action = "/v1/task";

  static Future<ApiReturnValue<List<Task>>> ListData(
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
      List<Task> value = (result['data']['data'] as Iterable)
          .map((e) => Task.fromJson(e))
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

  static Future<ApiReturnValue<Task>> ListDataById(int task_id) async {
    var result = await ApiExec(
      action + ('/') + task_id.toString(),
      httpMethod.GET,
      // param: company_id.toString(),
    );

    if (result['status']) {
      Task value = Task.fromJson(result['data']['data']);
      return ApiReturnValue(value: value);
    } else {
      if (result['message'] == unauthorized) {
        return ApiReturnValue(unauthorized: true);
      }
      return ApiReturnValue(message: result['message']);
    }
  }
}
