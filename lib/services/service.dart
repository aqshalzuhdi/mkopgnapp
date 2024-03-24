import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:pgnmko_flutter/shared/shared.dart';

import '../models/model.dart';

part 'auth_service.dart';
part 'user_service.dart';
part 'task_service.dart';
part 'task_result_service.dart';
part 'company_service.dart';
part 'task_category_service.dart';
part 'task_documentation_service.dart';
part 'task_documentation_category_service.dart';
part 'task_export_service.dart';
part 'total_service.dart';
part 'task_category_sub_service.dart';
part 'trouble_report_service.dart';

String schemeURL = "http";
// String baseURL = "192.168.1.39:8000";
// String basePATH = "/api/user";

String baseURL = "api.pgn.asal.my.id";
String basePATH = "/api/user";

// String baseURL = "destined-kite-painfully.ngrok-free.app";
String headerWarning = "ngrok-skip-browser-warning";
