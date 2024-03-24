part of 'model.dart';

class TroubleReport extends Equatable {
  final int? id;
  final Company? company;
  final User? user;
  final String? date;
  final String? receivedTime;
  final String? responseTime;
  final String? description;
  final String? analysis;
  final SolutionMethod? solutionMethod;
  final String? solutionTime;
  final String? createdAt;
  final String? updatedAt;

  const TroubleReport({
    this.id,
    this.company,
    this.user,
    this.date,
    this.receivedTime,
    this.responseTime,
    this.description,
    this.analysis,
    this.solutionMethod,
    this.solutionTime,
    this.createdAt,
    this.updatedAt,
  });

  factory TroubleReport.fromJson(Map<String, dynamic> data) => TroubleReport(
        id: data['id'],
        company: Company.fromJson(data['company']),
        user: User.fromJson(data['user']),
        receivedTime: data['received_time'],
        responseTime: data['response_time'],
        description: data['description'],
        analysis: data['analysis'],
        solutionMethod: SolutionMethod.fromJson(data['solution_method']),
        solutionTime: data['solution_time'],
        createdAt: data['created_at'],
        updatedAt: data['updated_at'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        company,
        user,
        receivedTime,
        responseTime,
        description,
        analysis,
        solutionMethod,
        solutionTime,
        createdAt,
        updatedAt,
      ];
}
