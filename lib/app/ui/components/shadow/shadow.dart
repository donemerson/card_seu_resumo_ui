import 'package:flutter/material.dart';
import '../../../resources/resources.dart';

class MyShadow {
  // Botão "ver mais"
  static const List<BoxShadow> s1 = [
    BoxShadow(
      offset: Offset(1, 1),
      blurRadius: 1,
      color: MyColors.sombra1,
    )
  ];
  // Card resumo
  static const List<BoxShadow> s2 = [
    BoxShadow(
      offset: Offset(1, 1),
      blurRadius: 1,
      color: MyColors.sombra2,
    )
  ];
}
