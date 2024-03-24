part of 'model.dart';

class Total extends Equatable {
  final int? om;
  final int? tpg;
  final int? amr;

  const Total({
    this.om,
    this.tpg,
    this.amr,
  });

  factory Total.fromJson(Map<String, dynamic> data) => Total(
        om: data['om'],
        tpg: data['tpg'],
        amr: data['amr'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [om, tpg, amr];
}
