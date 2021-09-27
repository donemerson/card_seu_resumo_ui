@Tags(['factory'])

import 'package:card_seu_resumo_ui/app/data/data.dart';
import 'package:card_seu_resumo_ui/app/factories/factories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory Make DBClient:', () {
    late DBClient dbClient;
    setUpAll(() {
      dbClient = makeDBAdapter();
    });
    test('Deveria instanciar um DBClient', () async {
      expect(dbClient, isNotNull);
      expect(dbClient, isA<DBClient>());
    });
  });
}
