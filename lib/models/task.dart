part of 'model.dart';

class Task extends Equatable {
  final int? id;
  final CompanyTask? company;
  final UserTask? technician;
  final UserTask? confirmedBy;
  final List<Result>? result;
  final String? dateOfCompletion;
  final TaskExport? taskExport;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  const Task({
    this.id,
    this.company,
    this.technician,
    this.confirmedBy,
    this.result,
    this.dateOfCompletion,
    this.taskExport,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> data) => Task(
        id: data['id'],
        company: CompanyTask.fromJson(data['company']),
        // technician: UserTask.fromJson(data['technician']),
        // confirmedBy: UserTask.fromJson(data['confirmed_by']),
        result: (data['result'] == null)
            ? null
            : List<Result>.from(
                data['result'].map((e) => Result.fromJson(e)).toList(),
              ),
        taskExport: (data['task_export'] == null)
            ? null
            : TaskExport.fromJson(data['task_export']),
        dateOfCompletion: data['date_of_completion'],
        status: data['status'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  Task copyWith({
    int? id,
    CompanyTask? company,
    UserTask? technician,
    UserTask? confirmedBy,
    String? dateOfCompletion,
    TaskExport? taskExport,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return Task(
      id: id ?? this.id,
      company: company ?? this.company,
      technician: technician ?? this.technician,
      confirmedBy: confirmedBy ?? this.confirmedBy,
      dateOfCompletion: dateOfCompletion ?? this.dateOfCompletion,
      taskExport: taskExport ?? this.taskExport,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        company,
        technician,
        confirmedBy,
        dateOfCompletion,
        taskExport,
        status,
        createdAt,
        updatedAt,
      ];

  // "id": 1,
  // "company": {
  //     "id": 1,
  //     "logo": "default.png",
  //     "operating_area_id": 1,
  //     "device_id": 2,
  //     "name": "PT SUKA MAJU MUNDUR",
  //     "village_id": "123",
  //     "address": "asd",
  //     "created_at": "2023-08-07T14:29:34.000000Z",
  //     "updated_at": "2023-08-08T00:34:57.000000Z"
  // },
  // "technician": {
  //     "id": 1,
  //     "name": "aqshal",
  //     "email": "aqshal@gmail.com",
  //     "phone_number": "6281259304885"
  // },
  // "confirmed_by": {
  //     "id": 1,
  //     "leader": {
  //         "id": 1,
  //         "name": "aqshal",
  //         "email": "aqshal@gmail.com",
  //         "phone_number": "6281259304885"
  //     },
  //     "status": 0,
  //     "created_at": null,
  //     "updated_at": null
  // },
  // "status": 0,
  // "created_at": "2023-08-07T20:39:18.000000Z",
  // "updated_at": "2023-08-07T20:39:18.000000Z"
}

class CompanyTask extends Equatable {
  final int? id;
  final String? logo;
  final int? operatingAreaId;
  final int? deviceId;
  final DeviceCompanyTask? device;
  final String? name;
  final String? villageId;
  final String? address;
  final String? createdAt;
  final String? updatedAt;

  const CompanyTask({
    this.id,
    this.logo,
    this.operatingAreaId,
    this.deviceId,
    this.device,
    this.name,
    this.villageId,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory CompanyTask.fromJson(Map<String, dynamic> data) => CompanyTask(
        id: data['id'],
        logo: data['logo'],
        operatingAreaId: data['operating_area_id'],
        deviceId: data['device_id'],
        device: DeviceCompanyTask.fromJson(data['device'] ?? {}),
        // (data['device'] == null)
        //     ? null
        //     : DeviceCompanyTask.fromJson(data['device']),
        name: data['name'],
        villageId: data['village_id'],
        address: data['address'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  CompanyTask copyWith({
    int? id,
    String? logo,
    int? operatingAreaId,
    int? deviceId,
    String? name,
    String? villageId,
    String? address,
    String? createdAt,
    String? updatedAt,
  }) {
    return CompanyTask(
      id: id ?? this.id,
      logo: logo ?? this.logo,
      operatingAreaId: operatingAreaId ?? this.operatingAreaId,
      deviceId: deviceId ?? this.deviceId,
      device: device ?? this.device,
      name: name ?? this.name,
      villageId: villageId ?? this.villageId,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        logo,
        operatingAreaId,
        deviceId,
        device,
        name,
        villageId,
        address,
        createdAt,
        updatedAt
      ];
}

//Company."device": {
//                 "id": 2,
//                 "serial_number": "1104800131",
//                 "merk": "ELGAS",
//                 "type": "DATCOM AMR 3/S",
//                 "created_year": "2011",
//                 "status": 2,
//                 "reason": null,
//                 "created_at": "2023-08-08T00:09:18.000000Z",
//                 "updated_at": "2023-08-08T00:34:57.000000Z"
//             }

class DeviceCompanyTask extends Equatable {
  final int? id;
  final String? serialNumber;
  final String? merk;
  final String? type;
  final String? createdYear;
  final int? status;
  final String? reason;
  final String? createdAt;
  final String? updatedAt;

  const DeviceCompanyTask({
    this.id,
    this.serialNumber,
    this.merk,
    this.type,
    this.createdYear,
    this.status,
    this.reason,
    this.createdAt,
    this.updatedAt,
  });

  factory DeviceCompanyTask.fromJson(Map<String, dynamic> data) =>
      DeviceCompanyTask(
        id: data['id'] ?? 0,
        serialNumber: data['serial_number'] ?? '-',
        merk: data['merk'] ?? '-',
        type: data['type'] ?? '-',
        createdYear: data['created_year'] ?? '-',
        status: data['status'] ?? 0,
        reason: data['reason'] ?? '-',
        createdAt: data['created_at'] ?? '-',
        updatedAt: data['updated_at'] ?? '-',
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        serialNumber,
        merk,
        type,
        createdYear,
        status,
        reason,
        createdAt,
        updatedAt,
      ];
}

class UserTask extends Equatable {
  //     "id": 1,
  //     "name": "aqshal",
  //     "email": "aqshal@gmail.com",
  //     "phone_number": "6281259304885"
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;

  const UserTask({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
  });

  factory UserTask.fromJson(Map<String, dynamic> data) => UserTask(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        phoneNumber: data['phone_number'],
      );

  UserTask copyWith({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
  }) {
    return UserTask(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
      ];
}

class ConfirmedByTask extends Equatable {
  //     "id": 1,
  //     "leader": {
  //         "id": 1,
  //         "name": "aqshal",
  //         "email": "aqshal@gmail.com",
  //         "phone_number": "6281259304885"
  //     },
  //     "status": 0,
  //     "created_at": null,
  //     "updated_at": null

  final int? id;
  final UserTask? leader;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  const ConfirmedByTask({
    this.id,
    this.leader,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ConfirmedByTask.fromJson(Map<String, dynamic> data) =>
      ConfirmedByTask(
        id: data['id'],
        leader: data['leader'],
        status: data['status'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  @override
  List<Object?> get props => [
        id,
        leader,
        status,
        createdAt,
        updatedAt,
      ];
}

class TaskDetail extends Equatable {
  final int? id;
  // final TaskCategory? taskCategory;
  final String? name;
  final String? key;
  final String? element;
  final String? createdAt;
  final String? updatedAt;
  final Task2Result? task2Result;

  const TaskDetail({
    this.id,
    // this.taskCategory,
    this.name,
    this.key,
    this.element,
    this.createdAt,
    this.updatedAt,
    this.task2Result,
  });

  factory TaskDetail.fromJson(Map<String, dynamic> data) => TaskDetail(
        id: data['id'],
        // taskCategory: (data['task_category'] == null)
        //     ? null
        //     : TaskCategory.fromJson(data['task_category']),
        name: data['name'],
        key: data['key'],
        element: data['element'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
        task2Result: (data['task_result'] == null)
            ? null
            : Task2Result.fromJson(data['task_result']),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        // taskCategory,
        name,
        key,
        element,
        createdAt,
        updatedAt,
        task2Result,
      ];
}

class Result extends Equatable {
  final int? id;
  final String? name;
  final String? key;
  // final TaskCategory? taskCategory;
  final List<TaskDetail>? taskDetail;

  const Result({
    this.id,
    this.name,
    this.key,
    // this.taskCategory,
    this.taskDetail,
  });

  factory Result.fromJson(Map<String, dynamic> data) => Result(
        id: data['id'],
        name: data['name'],
        key: data['key'],
        // taskCategory: TaskCategory.fromJson(data['task_category']),
        taskDetail: (data['task_details'] == null)
            ? null
            : List<TaskDetail>.from(
                    data['task_details'].map((e) => TaskDetail.fromJson(e)))
                .toList(),
      );

  // Result copyWith({
  //   TaskCategory? taskCategory,
  //   TaskDetail? taskDetail,
  // }) {
  //   return Result(
  //     taskCategory: taskCategory ?? this.taskCategory,
  //     taskDetail: taskDetail ?? this.taskDetail,
  //   );
  // }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        key,
        // taskCategory,
        taskDetail,
      ];
}

class Task2Result extends Equatable {
  final int? id;
  final int? taskId;
  final int? taskDetailId;
  final String? value;
  final String? valueText;
  final String? createdAt;
  final String? updatedAt;

  const Task2Result({
    this.id,
    this.taskId,
    this.taskDetailId,
    this.value,
    this.valueText,
    this.createdAt,
    this.updatedAt,
  });

  factory Task2Result.fromJson(Map<String, dynamic> data) => Task2Result(
        id: data['id'],
        taskId: data['task_id'],
        taskDetailId: data['task_detail_id'],
        value: data['value'],
        valueText: data['value_text'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        taskId,
        taskDetailId,
        value,
        valueText,
        createdAt,
        updatedAt,
      ];
}
