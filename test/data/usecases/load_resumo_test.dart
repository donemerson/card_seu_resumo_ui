@Timeout(Duration(seconds: 30))
@Tags(['usercases', 'resumo'])

import 'dart:convert';

import 'package:card_seu_resumo_ui/mocks/local_mock_load_resumo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:card_seu_resumo_ui/app/data/data.dart';
import 'package:card_seu_resumo_ui/app/domain/domain.dart';
import 'package:card_seu_resumo_ui/app/infra/infra.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'load_resumo_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final MockClient clientMock = MockClient();
  late final LoadResumo usercase;
  late final GraphQLClient graphQLClient;

  setUpAll(() {
    graphQLClient = GraphQLAdapter(clientMock);
    usercase = RemoteLoadResumo(graphQLClient: graphQLClient, url: '');
  });

  PostExpectation<Future<http.Response>> mockRequest() =>
      when(clientMock.post(any,
          body: anyNamed("body"),
          encoding: anyNamed("encoding"),
          headers: anyNamed("headers")));

  void mockRequestData(http.Response data) {
    mockRequest().thenAnswer((_) async => data);
  }

  void mockRequestThrow(HttpError error) async =>
      mockRequest().thenThrow(error);

  group('Caso de uso Load Resumo:', () {
    test('Deveria retornar lista de entity', () async {
      final response =
          http.Response(jsonEncode(LocalMockLoadResumo.listaResumoJson), 200);
      mockRequestData(response);

      final lista = await usercase.getResumos();

      expect(
          lista.length,
          equals(LocalMockLoadResumo
              .listaResumoJson['data']['wealthSummary'].length));
    });

    test(
      'Deveria retornar erro de dominio',
      () async {
        mockRequestThrow(HttpError.badRequest);

        late Object error;

        try {
          error = await usercase.getResumos();
        } catch (e) {
          error = e;
        }

        expect(error, DomainError.unexpected);
      },
    );
  });
}
