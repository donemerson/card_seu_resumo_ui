import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../ui.dart';
import '../../../domain/domain.dart';
import '../../../resources/resources.dart';
import 'resumo_presenter.dart';

class ResumoPage extends StatefulWidget {
  final ResumoPresenter presenter;
  const ResumoPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<ResumoPage> createState() => _ResumoPageState();
}

class _ResumoPageState extends State<ResumoPage> {
  @override
  void initState() {
    widget.presenter.reload();
    super.initState();
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }

  ResumoPresenter get presenter => widget.presenter;
  ResumoEntity? get resumoEntity => presenter.resumoEntity;
  UIState get state => presenter.state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Center(
        child: Observer(
          builder: (_) {
            final _model = CardResumoModel(
              isLoading: state != UIState.done,
              rentabilidadeMes: resumoEntity?.profitability ?? 0.0,
              cdi: resumoEntity?.cdi ?? 0.0,
              ganhoMes: resumoEntity?.gain ?? 0.0,
              valorInvestido: resumoEntity?.total ?? 0.0,
              onVerMais: presenter.onVerMais,
              onMenu: presenter.onMenu,
            );

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: CardResumoWidget(
                model: _model,
              ),
            );
          },
        ),
      ),
    );
  }
}
