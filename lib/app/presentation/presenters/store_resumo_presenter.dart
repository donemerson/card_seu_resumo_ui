import 'dart:async';
import 'package:mobx/mobx.dart';
import '../../domain/domain.dart';
import '../../ui/ui.dart';

class StoreResumoPresenter implements ResumoPresenter {
  StoreResumoPresenter(this._loadResumo);

  final LoadResumo _loadResumo;

  @override
  ResumoEntity? get resumoEntity => _resumoEntityObs.value;
  set _resumoEntity(ResumoEntity value) =>
      runInAction(() => _resumoEntityObs.value = value,
          name: 'setResumoEntity');
  final _resumoEntityObs =
      Observable<ResumoEntity?>(null, name: 'resumoEntity');

  @override
  UIState get state => _stateObs.value;
  set _state(UIState value) => runInAction(() => _stateObs.value = value);
  final _stateObs = Observable<UIState>(UIState.loading, name: 'UIState');

  @override
  Future<void> reload() async {
    if (state != UIState.loading) _state = UIState.loading;
    await _load();
  }

  Future<void> _load() async {
    try {
      var listEntity = await _loadResumo.getResumos();
      if (listEntity.isNotEmpty) {
        _resumoEntity = listEntity.first;
        _state = UIState.done;
      } else {
        _state = UIState.error;
      }
    } catch (_) {
      _state = UIState.error;
    }
  }

  @override
  void dispose() {
    //empty
  }

  @override
  void onMenu() {}

  @override
  void onVerMais() {}
}
