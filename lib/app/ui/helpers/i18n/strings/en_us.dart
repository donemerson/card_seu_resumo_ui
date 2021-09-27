import 'package:intl/intl.dart';

import './translation.dart';

class EnUs implements Translation {
  // I dont know :(
  @override
  String get cdi => 'CDI';

  @override
  String get ganhoMes => 'Profit/month';

  @override
  String get moneySimbolo => '\$';

  @override
  String get rentabilidadeMes => 'Profitability/month';

  @override
  String get seuResumo => 'Your summary';

  @override
  String get valorInvestido => 'Amount invested';

  @override
  String get verMais => 'MORE';

  @override
  String moneyFormat(double valor) {
    return NumberFormat.decimalPattern("en_US").format(valor);
  }
}
