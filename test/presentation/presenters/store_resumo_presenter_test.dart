import 'package:card_seu_resumo_ui/app/data/data.dart';
import 'package:card_seu_resumo_ui/app/domain/domain.dart';
import 'package:card_seu_resumo_ui/app/presentation/presentation.dart';
import 'package:card_seu_resumo_ui/app/ui/helpers/helpers.dart';
import 'package:card_seu_resumo_ui/app/ui/pages/pages.dart';
import 'package:card_seu_resumo_ui/mocks/local_mock_load_resumo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'store_resumo_presenter_test.mocks.dart';

@GenerateMocks([LoadResumo])
void main() {
  late ResumoPresenter presenter;
  final MockLoadResumo loadResumo = MockLoadResumo();

  setUp(() {
    presenter = StoreResumoPresenter(loadResumo);
  });

  tearDown(() {
    presenter.dispose();
  });

  PostExpectation<Future<List<ResumoEntity>>> mockRequest() =>
      when(loadResumo.getResumos());

  void mockData(List<ResumoEntity> data) {
    mockRequest().thenAnswer((_) async => data);
  }

  void mockThrow(DomainError error) async => mockRequest().thenThrow(error);

  List<ResumoEntity> getData() {
    final lista = <ResumoEntity>[];
    lista.add(
        RemoteResumoModel.fromJson(LocalMockLoadResumo.resumoJson).toEntity());
    return lista;
  }

  group('BlocResumoPresenter: ', () {
    final data = getData();

    test(
      'Deveria estar com status carregando para carregado',
      () async {
        mockData(data);
        expect(presenter.state, equals(UIState.loading));
        await presenter.reload();
        expect(presenter.state, equals(UIState.done));
      },
    );

    test(
      'Deveria estar com status carregando para error',
      () async {
        mockThrow(DomainError.unexpected);
        expect(presenter.state, equals(UIState.loading));
        await presenter.reload();
        expect(presenter.state, equals(UIState.error));
        expect(presenter.resumoEntity, isNull);
      },
    );

    test(
      'Deveria ter uma instancia de ResumoEntity"',
      () async {
        mockData(data);
        await presenter.reload();
        expect(presenter.resumoEntity, isNotNull);
        expect(presenter.resumoEntity, isA<ResumoEntity>());
      },
    );
  });
}
