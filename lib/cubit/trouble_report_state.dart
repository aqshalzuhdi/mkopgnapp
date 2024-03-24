part of 'trouble_report_cubit.dart';

sealed class TroubleReportState extends Equatable {
  const TroubleReportState();

  @override
  List<Object> get props => [];
}

final class TroubleReportInitial extends TroubleReportState {}

class TroubleReportUnauthorized extends TroubleReportState {
  final bool unauthorized;

  const TroubleReportUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}

class TroubleReportSuccess extends TroubleReportState {
  final List<TroubleReport> data;

  const TroubleReportSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class TroubleReportFailed extends TroubleReportState {
  final String message;
  final Map<String, dynamic> exception;

  const TroubleReportFailed(this.message, this.exception);

  @override
  List<Object> get props => [message, exception];
}
