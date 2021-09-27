import 'package:intl/intl.dart';
import './translation.dart';

class PtBr implements Translation {
  @override
  String get cdi => 'CDI';

  @override
  String get ganhoMes => 'Ganho/mês';

  @override
  String get moneySimbolo => 'R\$';

  @override
  String get rentabilidadeMes => 'Rentabilidade/mês';

  @override
  String get seuResumo => 'Seu resumo';

  @override
  String get valorInvestido => 'Valor investido';

  @override
  String get verMais => 'VER MAIS';

  @override
  String moneyFormat(double valor) {
    return NumberFormat("#,##0.00", "pt_BR").format(valor);
  }
}
