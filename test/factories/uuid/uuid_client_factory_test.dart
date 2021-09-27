import 'package:card_seu_resumo_ui/app/data/data.dart';
import 'package:card_seu_resumo_ui/app/factories/factories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory Make UuidClient:', () {
    test('Deveria instanciar um UuidClient', () async {
      final graphQLClient = makeUuidAdapter();
      expect(graphQLClient, isNotNull);
      expect(graphQLClient, isA<UuidClient>());
    });
  });
}
