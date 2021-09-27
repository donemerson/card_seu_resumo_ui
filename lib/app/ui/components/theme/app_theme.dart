import 'package:flutter/material.dart';
import '../../../resources/resources.dart';

ThemeData makeAppTheme() {
  const primaryColor = MyColors.blue1;
  const primaryColorDark = MyColors.blue1;
  const primaryColorLight = MyColors.blue1;

  const secondaryColor = primaryColor;
  const secondaryColorDark = primaryColorDark;

  const disabledColor = MyColors.sombra2;
  const dividerColor = MyColors.sombra2;

  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: MyColors.white,
      centerTitle: true,
    ),
    fontFamily: 'ProximaNova',
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    highlightColor: secondaryColor,
    secondaryHeaderColor: secondaryColorDark,
    disabledColor: disabledColor,
    dividerColor: dividerColor,
    backgroundColor: MyColors.white,
    scaffoldBackgroundColor: MyColors.white,
    dialogBackgroundColor: MyColors.white,
  );
}
