part of 'service.dart';

class TaskCategoryService {
  static String action = "/v1/task/category";

  static Future<ApiReturnValue<List<TaskCategory>>> ListData() async {
    var result = await ApiExec(action, httpMethod.GET);

    if (result['status']) {
      List<TaskCategory> value = (result['data']['data'] as Iterable)
          .map((e) => TaskCategory.fromJson(e))
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
