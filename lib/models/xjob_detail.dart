// part of 'model.dart';

// // "data": {
// //         "id": 2,
// //         "status": 0,
// //         "created_at": "2023-08-07T20:51:21.000000Z",
// //         "updated_at": "2023-08-07T20:51:21.000000Z"
// //     }
// class JobDetail extends Equatable {
//   final int? id;
//   final CompanyJobDetail? companyJobDetail;
//   final UserJobDetail? technician;
//   final UserJobDetail? confirmedBy;
//   final int? status;
//   final String? createdAt;
//   final String? updatedAt;

//   const JobDetail({
//     this.id,
//     this.companyJobDetail,
//     this.technician,
//     this.confirmedBy,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory JobDetail.fromJson(Map<String, dynamic> data) => JobDetail(
//         id: data['id'],
//         companyJobDetail: CompanyJobDetail.fromJson(data['company']),
//         technician: UserJobDetail.fromJson(data['technician']),
//         // confirmedBy: UserJobDetail.fromJson(data['confirmed_by']),
//         status: data['status'],
//         createdAt: data['created_at'],
//         updatedAt: data['updated_at'],
//       );

//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         id,
//         companyJobDetail,
//         technician,
//         confirmedBy,
//         status,
//         createdAt,
//         updatedAt,
//       ];
// }

// // company
// // "company": {
// //             "id": 2,
// //             "logo": "default.png",
// //             "operating_area_id": 1,
// //             "device_id": 2,
// //             "name": "PT IMPACT INDONESIA",
// //             "village_id": "123",
// //             "address": "Gebang",
// //             "created_at": "2023-08-08T00:21:10.000000Z",
// //             "updated_at": "2023-08-09T02:11:14.000000Z",
// //         },
// class CompanyJobDetail extends Equatable {
//   final int? id;
//   final String? logo;
//   final int? operatingAreaId;
//   final CompanyOperatingAreaJobDetail? operatingArea;
//   final int? deviceId;
//   final CompanyDeviceJobDetail? device;
//   final String? name;
//   final String? villageId;
//   final String? address;
//   final String? createdAt;
//   final String? updatedAt;

//   const CompanyJobDetail({
//     this.id,
//     this.logo,
//     this.operatingAreaId,
//     this.operatingArea,
//     this.deviceId,
//     this.device,
//     this.name,
//     this.villageId,
//     this.address,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory CompanyJobDetail.fromJson(Map<String, dynamic> data) =>
//       CompanyJobDetail(
//         id: data['id'],
//         logo: data['logo'],
//         operatingAreaId: data['operating_area_id'],
//         operatingArea:
//             CompanyOperatingAreaJobDetail.fromJson(data['operating_area']),
//         deviceId: data['device_id'],
//         device: CompanyDeviceJobDetail.fromJson(data['device']),
//         name: data['name'],
//         villageId: data['village_id'],
//         address: data['address'],
//         createdAt: data['created_at'],
//         updatedAt: data['updated_at'],
//       );

//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         id,
//         logo,
//         operatingAreaId,
//         deviceId,
//         name,
//         villageId,
//         address,
//         createdAt,
//         updatedAt,
//       ];
// }

// //Company."operating_area": {
// //                 "id": 1,
// //                 "regency_id": "123",
// //                 "value": "III",
// //                 "created_at": "2023-08-07T14:23:01.000000Z",
// //                 "updated_at": "2023-08-07T14:23:01.000000Z"
// //             },
// class CompanyOperatingAreaJobDetail extends Equatable {
//   final int? id;
//   final String? regencyId;
//   final String? value;
//   final String? createdAt;
//   final String? updatedAt;

//   const CompanyOperatingAreaJobDetail({
//     this.id,
//     this.regencyId,
//     this.value,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory CompanyOperatingAreaJobDetail.fromJson(Map<String, dynamic> data) =>
//       CompanyOperatingAreaJobDetail(
//         id: data['id'],
//         regencyId: data['regency_id'],
//         value: data['value'],
//         createdAt: data['created_at'],
//         updatedAt: data['updated_at'],
//       );

//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         id,
//         regencyId,
//         value,
//         createdAt,
//         updatedAt,
//       ];
// }

// //Company."device": {
// //                 "id": 2,
// //                 "serial_number": "1104800131",
// //                 "merk": "ELGAS",
// //                 "type": "DATCOM AMR 3/S",
// //                 "created_year": "2011",
// //                 "status": 2,
// //                 "reason": null,
// //                 "created_at": "2023-08-08T00:09:18.000000Z",
// //                 "updated_at": "2023-08-08T00:34:57.000000Z"
// //             }

// class CompanyDeviceJobDetail extends Equatable {
//   final int? id;
//   final String? serialNumber;
//   final String? merk;
//   final String? type;
//   final String? createdYear;
//   final int? status;
//   final String? reason;
//   final String? createdAt;
//   final String? updatedAt;

//   CompanyDeviceJobDetail({
//     this.id,
//     this.serialNumber,
//     this.merk,
//     this.type,
//     this.createdYear,
//     this.status,
//     this.reason,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory CompanyDeviceJobDetail.fromJson(Map<String, dynamic> data) =>
//       CompanyDeviceJobDetail(
//         id: data['id'],
//         serialNumber: data['serial_number'],
//         merk: data['merk'],
//         type: data['type'],
//         createdYear: data['created_year'],
//         status: data['status'],
//         reason: data['reason'],
//         createdAt: data['created_at'],
//         updatedAt: data['updated_at'],
//       );

//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         id,
//         serialNumber,
//         merk,
//         type,
//         createdYear,
//         status,
//         reason,
//         createdAt,
//         updatedAt,
//       ];
// }

// // technician
// // "technician": {
// //             "id": 1,
// //             "name": "aqshalss1",
// //             "email": "aqshal@gmail.com",
// //             "phone_number": "6281259304885"
// //         },
// class UserJobDetail extends Equatable {
//   final int? id;
//   final String? name;
//   final String? email;
//   final String? phoneNumber;

//   const UserJobDetail({
//     this.id,
//     this.name,
//     this.email,
//     this.phoneNumber,
//   });

//   factory UserJobDetail.fromJson(Map<String, dynamic> data) => UserJobDetail(
//         id: data['id'],
//         name: data['name'],
//         email: data['email'],
//         phoneNumber: data['phone_number'],
//       );

//   @override
//   // TODO: implement props
//   List<Object?> get props => [id, name, email, phoneNumber];
// }

// // confirmed_by
// // "confirmed_by": {
// //             "id": 1,
// //             "name": "aqshalss1",
// //             "email": "aqshal@gmail.com",
// //             "phone_number": "6281259304885"
// //         },