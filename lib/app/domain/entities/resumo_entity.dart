class ResumoEntity {
  int id; // integer, primary key, unique
  double total; // numeric
  bool hasHistory; // boolean
  double cdi; // numeric
  double gain; // numeric
  double profitability; // numeric, nulabble

  ResumoEntity({
    required this.total,
    required this.id,
    required this.hasHistory,
    required this.cdi,
    required this.profitability,
    required this.gain,
  });
}
