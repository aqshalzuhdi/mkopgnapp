part of 'service.dart';

class TaskExportService {
  static String action = "/v1/task/export";

  static Future<ApiReturnValue<Task>> ListDataById(int id) async {
    var result =
        await ApiExec(action, httpMethod.GET, param: '/' + id.toString());

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

  static Future<ApiReturnValue<String>> InsertData({
    required String taskId,
  }) async {
    var result = await ApiExec(
      action,
      httpMethod.POST,
      param: jsonEncode(
        <String, String>{
          "task_id": taskId,
        },
      ),
    );

    print(result);
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
