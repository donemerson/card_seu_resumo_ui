import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';
import '../../../ui.dart';

class TextValorInvestidoWidget extends StatelessWidget {
  const TextValorInvestidoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      R.string.valorInvestido,
      style: MyTypography.proximaNovaMedium16.apply(
        color: MyColors.grey01,
      ),
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }
}
