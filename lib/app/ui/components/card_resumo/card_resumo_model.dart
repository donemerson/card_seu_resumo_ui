import 'dart:async';

class CardResumoModel {
  final double rentabilidadeMes;
  final double cdi;
  final double ganhoMes;
  final double valorInvestido;
  final FutureOr<void> Function() onVerMais;
  final FutureOr<void> Function() onMenu;
  final bool isLoading;

  CardResumoModel({
    required this.isLoading,
    required this.rentabilidadeMes,
    required this.cdi,
    required this.ganhoMes,
    required this.valorInvestido,
    required this.onVerMais,
    required this.onMenu,
  });
}
