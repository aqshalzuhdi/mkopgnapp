part of 'model.dart';

class Company extends Equatable {
  // "id": 3,
  // "logo": "default.png",
  // "operating_area_id": 3,
  // "device_id": 3,
  // "name": "PT SUKA MAJU MUNDUR",
  // "village_id": "123",
  // "address": "asd",
  // "created_at": "2023-08-08T00:38:28.000000Z",
  // "updated_at": "2023-08-08T00:38:28.000000Z",

  final int? id;
  final String? logo;
  final int? operatingAreaId;
  final int? deviceId;
  final String? name;
  final String? villageId;
  final String? address;
  final String? createdAt;
  final String? updatedAt;

  const Company({
    this.id,
    this.logo,
    this.operatingAreaId,
    this.deviceId,
    this.name,
    this.villageId,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory Company.fromJson(Map<String, dynamic> data) => Company(
        id: data['id'],
        logo: data['logo'],
        operatingAreaId: data['operating_area_id'],
        deviceId: data['device_id'],
        name: data['name'],
        villageId: data['village_id'],
        address: data['address'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  @override
  List<Object?> get props => [
        id,
        logo,
        operatingAreaId,
        deviceId,
        name,
        villageId,
        address,
        createdAt,
        updatedAt,
      ];

  // "operating_area": {
  //     "id": 1,
  //     "regency_id": "123",
  //     "value": "III",
  //     "created_at": "2023-08-07T14:23:01.000000Z",
  //     "updated_at": "2023-08-07T14:23:01.000000Z"
  // },
  // "device": {
  //     "id": 1,
  //     "serial_number": "1104800133",
  //     "merk": "ELGAS",
  //     "type": "DATCOM AMR 3/S",
  //     "created_year": "2012",
  //     "status": 2,
  //     "reason": null,
  //     "created_at": "Selasa, 8 Agustus 2023 | 00:09 am",
  //     "updated_at": "Selasa, 8 Agustus 2023 | 00:39 am"
  // }
}
