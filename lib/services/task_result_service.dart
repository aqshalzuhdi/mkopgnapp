part of 'service.dart';

class TaskResultService {
  static String action = "/v1/task/result";

  static Future<ApiReturnValue<List<TaskResult>>> ListData(
    int? taskId,
    int? taskCategoryId,
  ) async {
    var result = await ApiExec(
      action,
      httpMethod.GET,
      queryParameter: {
        "filter[task_id]": taskId.toString(),
        // "filter[task_category_id]": taskCategoryId.toString(),
      },
    );

    if (result['status']) {
      List<TaskResult> value = (result['data']['data'] as Iterable)
          .map((e) => TaskResult.fromJson(e))
          .toList();
      return ApiReturnValue(value: value);
    } else {
      if (result['message'] == unauthorized) {
        return ApiReturnValue(unauthorized: true);
      }
      return ApiReturnValue(message: result['message']);
    }
  }

  static Future<ApiReturnValue<TaskResult>> ListDataById(int id) async {
    var result = await ApiExec(action, httpMethod.GET, param: id);

    if (result['status']) {
      TaskResult value = TaskResult.fromJson(result['data']['data']);
      return ApiReturnValue(value: value);
    } else {
      if (result['message'] == unauthorized) {
        return ApiReturnValue(unauthorized: true);
      }
      return ApiReturnValue(message: result['message']);
    }
  }

  static Future<ApiReturnValue<String>> InsertData({
    required String taskId,
    required String taskDetailId,
    required String value,
  }) async {
    var result = await ApiExec(
      action,
      httpMethod.POST,
      param: jsonEncode(
        <String, String>{
          "task_id": taskId,
          "task_detail_id": taskDetailId,
          "date_of_completion": DateFormat("yyyy-MM-d").format(DateTime.now()),
          "value": value,
        },
      ),
    );

    if (result['status']) {
      String message =
          result['data']["message"]; //JobResultSubmit.fromJson(result['data']);
      return ApiReturnValue(value: message);
    } else {
      if (result['message'] == unauthorized) {
        return ApiReturnValue(unauthorized: true);
      }
      return ApiReturnValue(message: result['message']);
    }
  }
}
