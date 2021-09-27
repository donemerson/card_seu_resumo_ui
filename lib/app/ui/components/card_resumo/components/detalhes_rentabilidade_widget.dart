import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';
import '../../../ui.dart';

class DetalhesRentabilidade extends StatelessWidget {
  final bool isLoading;
  final double rentabilidadeMes;
  final double cdi;
  final double ganhoMes;
  const DetalhesRentabilidade({
    Key? key,
    required this.isLoading,
    required this.rentabilidadeMes,
    required this.cdi,
    required this.ganhoMes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _RentabilidadeRow(
          texto1: R.string.rentabilidadeMes,
          valor: rentabilidadeMes,
          sufixo: '%',
          animated: false,
          isLoading: isLoading,
          shimmer: AnimatedShimmer(
            size: Size(90, 30),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: _RentabilidadeRow(
            texto1: R.string.cdi,
            valor: cdi,
            sufixo: '%',
            animated: false,
            isLoading: isLoading,
            shimmer: AnimatedShimmer(
              size: Size(70, 30),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: _RentabilidadeRow(
            shimmer: AnimatedShimmer(
              size: Size(110, 30),
            ),
            texto1: R.string.ganhoMes,
            prefixo: '${R.string.moneySimbolo} ',
            valor: ganhoMes,
            animated: true,
            isLoading: isLoading,
          ),
        ),
      ],
    );
  }
}

class _RentabilidadeRow extends StatelessWidget {
  final String texto1;
  final double valor;
  final String prefixo;
  final String sufixo;
  final bool animated;
  final bool isLoading;
  final Widget shimmer;
  const _RentabilidadeRow(
      {Key? key,
      required this.texto1,
      required this.valor,
      required this.animated,
      this.prefixo = '',
      this.sufixo = '',
      required this.isLoading,
      required this.shimmer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          texto1,
          style: MyTypography.proximaNovaMedium16.apply(
            color: MyColors.grey01,
          ),
          maxLines: 1,
        ),
        if (isLoading)
          shimmer
        else
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (animated)
                AnimatedNumTween(
                  valor: valor,
                  widgetBuilder: (valor) => Text(
                    prefixo + R.string.moneyFormat(valor) + sufixo,
                    style: MyTypography.proximaNovaExtraBold25.apply(
                      color: MyColors.blue1,
                    ),
                    maxLines: 1,
                  ),
                )
              else
                Text(
                  prefixo + R.string.moneyFormat(valor) + sufixo,
                  style: MyTypography.proximaNovaExtraBold25.apply(
                    color: MyColors.blue1,
                  ),
                ),
            ],
          )
      ],
    );
  }
}
