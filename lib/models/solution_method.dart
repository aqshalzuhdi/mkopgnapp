part of 'model.dart';

class SolutionMethod extends Equatable {
  final int? id;
  // final User? user;
  final String? value;
  final int? group;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  const SolutionMethod({
    this.id,
    // this.user,
    this.value,
    this.group,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory SolutionMethod.fromJson(Map<String, dynamic> data) => SolutionMethod(
        id: data['id'],
        // user: User.fromJson(data['user']),
        value: data['value'],
        group: data['group'],
        status: data['status'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        value,
        group,
        status,
        createdAt,
        updatedAt,
      ];
}
