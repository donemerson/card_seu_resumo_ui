@Tags(['models', 'resumo'])

import 'package:card_seu_resumo_ui/app/data/data.dart';
import 'package:card_seu_resumo_ui/app/domain/domain.dart';
import 'package:card_seu_resumo_ui/mocks/local_mock_load_resumo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RemoteResumoModel model;

  setUpAll(() {
    model = RemoteResumoModel.fromJson(LocalMockLoadResumo.resumoJson);
  });

  group('Model resumo', () {
    test('Deveria instanciar a partir de json', () {
      expect(model, allOf(isNotNull, isA<RemoteResumoModel>()));
    });

    test('Deveria atribuir valores corretamente', () {
      expect(model.cdi, allOf(equals(LocalMockLoadResumo.resumoJson['cdi'])));

      expect(model.gain, allOf(equals(LocalMockLoadResumo.resumoJson['gain'])));

      expect(model.hasHistory,
          allOf(equals(LocalMockLoadResumo.resumoJson['hasHistory'])));

      expect(model.id, allOf(equals(LocalMockLoadResumo.resumoJson['id'])));

      expect(model.profitability,
          allOf(equals(LocalMockLoadResumo.resumoJson['profitability'])));

      expect(
          model.total, allOf(equals(LocalMockLoadResumo.resumoJson['total'])));
    });

    test('Deveria retornar uma entidade', () {
      final entity = model.toEntity();
      expect(entity, isNotNull);
      expect(entity, isA<ResumoEntity>());
    });
  });
}
