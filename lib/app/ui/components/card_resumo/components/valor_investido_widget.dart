import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';
import '../../../ui.dart';
import 'text_valor_investido_widget.dart';

class ValorInvestidoWidget extends StatelessWidget {
  final double valorInvestido;
  final bool isLoading;
  const ValorInvestidoWidget(
      {Key? key, required this.valorInvestido, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _style = MyTypography.proximaNovaExtraBold25.apply(
      color: MyColors.blue1,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TextValorInvestidoWidget(),
        Container(
          margin: const EdgeInsets.only(
            top: 7,
          ),
          alignment: Alignment.center,
          child: (isLoading)
              ? AnimatedShimmer(
                  size: Size(160, 30),
                )
              : RichText(
                  text: TextSpan(
                    style: _style,
                    text: '${R.string.moneySimbolo} ',
                    children: [
                      WidgetSpan(
                        child: AnimatedNumTween(
                          valor: valorInvestido,
                          widgetBuilder: (valor) => Text(
                            R.string.moneyFormat(valor),
                            maxLines: 1,
                            style: _style,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
