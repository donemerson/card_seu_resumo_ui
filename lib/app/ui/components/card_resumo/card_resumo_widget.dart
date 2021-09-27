import 'package:flutter/material.dart';

import '../../ui.dart';
import '../../../resources/resources.dart';
import 'components/components.dart';

class CardResumoWidget extends StatelessWidget {
  final CardResumoModel model;
  const CardResumoWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      constraints: BoxConstraints(minHeight: 379),
      duration: Duration(milliseconds: 300),
      decoration: const BoxDecoration(
        color: MyColors.white,
        boxShadow: MyShadow.s2,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 24,
              right: 16.5,
              bottom: 35,
              top: 25,
            ),
            child: SeuResumoWidget(
              onMenuTap: model.onMenu,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 32),
            child: ValorInvestidoWidget(
              valorInvestido: model.valorInvestido,
              isLoading: model.isLoading,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20, left: 23.5, right: 23.5),
            child: DetalhesRentabilidade(
              isLoading: model.isLoading,
              rentabilidadeMes: model.rentabilidadeMes,
              cdi: model.cdi,
              ganhoMes: model.ganhoMes,
            ),
          ),
          TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 1000),
            tween: Tween<double>(begin: 0, end: _screenSize.width - (2 * 23.5)),
            builder: (_, value, child) {
              return SizedBox(
                width: value,
                child: child,
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(bottom: 23, left: 23.5, right: 23.5),
              child: Center(
                child: Divider(
                  color: MyColors.divider,
                  height: 1,
                ),
              ),
            ),
          ),
          TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 1000),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            builder: (_, value, child) {
              return Opacity(
                opacity: value,
                child: child,
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 14, right: 23.5),
              alignment: Alignment.topRight,
              child: RoundedButtonWidget(
                color: MyColors.blue1,
                text: R.string.verMais,
                onPressed: model.onVerMais,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
