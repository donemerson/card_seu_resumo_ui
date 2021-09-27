import '../../domain/domain.dart';

class RemoteResumoModel {
  int id; // integer, primary key, unique
  num total; // numeric
  bool hasHistory; // boolean
  num cdi; // numeric
  num gain; // numeric
  num? profitability; // numeric, nulabble

  RemoteResumoModel({
    required this.total,
    required this.id,
    required this.hasHistory,
    required this.cdi,
    required this.profitability,
    required this.gain,
  });
  factory RemoteResumoModel.fromJson(Map json) {
    return RemoteResumoModel(
      total: json['total'],
      id: json['id'],
      hasHistory: json['hasHistory'],
      cdi: json['cdi'],
      profitability: json['profitability'],
      gain: json['gain'],
    );
  }

  ResumoEntity toEntity() => ResumoEntity(
        id: id,
        total: total.toDouble(),
        hasHistory: hasHistory,
        cdi: cdi.toDouble(),
        profitability: profitability?.toDouble() ?? 0.0,
        gain: gain.toDouble(),
      );
}
