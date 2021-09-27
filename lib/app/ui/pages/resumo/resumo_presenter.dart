import '../../../domain/domain.dart';
import '../../helpers/helpers.dart';

abstract class ResumoPresenter implements Disposable {
  ResumoEntity? get resumoEntity;
  UIState get state;
  Future<void> reload();
  void onVerMais();
  void onMenu();
}
