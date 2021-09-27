import 'package:card_seu_resumo_ui/app/factories/factories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory Make ResumoPage:', () {
    late Widget page;
    setUpAll(() {
      page = makeResumoPage();
    });
    test('Deveria instanciar um Widget', () async {
      expect(page, isNotNull);
      expect(page, isA<Widget>());
    });
  });
}
