part of 'service.dart';

class TaskCategorySubService {
  static String action = "/v1/task/category/sub";

  static Future<ApiReturnValue<List<TaskCategorySub>>> ListData(
      int categoryId) async {
    var result = await ApiExec(
      action,
      httpMethod.GET,
      queryParameter: {
        "filter[task_category_id]": categoryId.toString(),
      },
    );

    if (result['status']) {
      List<TaskCategorySub> value = (result['data']['data'] as Iterable)
          .map((e) => TaskCategorySub.fromJson(e))
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
