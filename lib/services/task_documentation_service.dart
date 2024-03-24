part of 'service.dart';

class TaskDocumentationService {
  static String action = "/v1/task/documentation";

  static Future<ApiReturnValue<List<TaskDocumentation>>> ListData(
      int taskId) async {
    var result = await ApiExec(
      action,
      httpMethod.GET,
      queryParameter: {
        "filter[task_id]": taskId.toString(),
      },
    );

    if (result['status']) {
      List<TaskDocumentation> value = (result['data']['data'] as Iterable)
          .map((e) => TaskDocumentation.fromJson(e))
          .toList();
      return ApiReturnValue(value: value);
    } else {
      if (result['message'] == unauthorized) {
        return ApiReturnValue(unauthorized: true);
      }
      return ApiReturnValue(message: result['message']);
    }
  }

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
    required String base64,
    required String title,
  }) async {
    var result = await ApiExec(
      action,
      httpMethod.POST,
      param: jsonEncode(
        <String, String>{
          "task_id": taskId,
          "base64": base64,
          "title": title,
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

  static Future<ApiReturnValue<String>> UpdateData({
    required String id,
    String? taskId,
    required String base64,
    String? value,
  }) async {
    var result = await ApiExec(
      action + '/' + id,
      httpMethod.POST,
      param: jsonEncode(
        <String, String>{
          "_method": "PATCH",
          "task_id": taskId.toString(),
          "base64": base64,
          "value": value.toString(),
        },
      ),
    );

    print("id: ${result}");
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
