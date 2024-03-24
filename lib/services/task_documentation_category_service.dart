part of 'service.dart';

class TaskDocumentationCategoryService {
  static String action = "/v1/task/documentation/category";

  static Future<ApiReturnValue<List<TaskDocumentationCategory>>>
      ListData() async {
    var result = await ApiExec(
      action,
      httpMethod.GET,
      // queryParameter: {
      //   "filter[task_id]": taskId.toString(),
      // },
    );

    if (result['status']) {
      List<TaskDocumentationCategory> value =
          (result['data']['data'] as Iterable)
              .map((e) => TaskDocumentationCategory.fromJson(e))
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
