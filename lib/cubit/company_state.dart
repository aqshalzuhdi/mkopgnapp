part of 'company_cubit.dart';

sealed class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object> get props => [];
}

final class CompanyInitial extends CompanyState {}

class CompanyUnauthorized extends CompanyState {
  final bool unauthorized;

  const CompanyUnauthorized(this.unauthorized);

  @override
  List<Object> get props => [unauthorized];
}

class CompanySuccess extends CompanyState {
  final List<Company> company;

  const CompanySuccess(this.company);

  @override
  List<Object> get props => [company];
}

class CompanyFailed extends CompanyState {
  final String message;

  const CompanyFailed(this.message);

  @override
  List<Object> get props => [message];
}
