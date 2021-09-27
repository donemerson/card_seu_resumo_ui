import '../../usercases/usercases.dart';
import '../../../presentation/presentation.dart';
import '../../../ui/pages/pages.dart';

ResumoPresenter makeStoreResumoPresenter() =>
    StoreResumoPresenter(makeRemoteLoadResumo()); // TODO: singleton
