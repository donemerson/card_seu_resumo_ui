import 'package:card_seu_resumo_ui/app/factories/pages/resumo/resumo_presenter_factory.dart';
import 'package:card_seu_resumo_ui/app/ui/pages/pages.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory Make ResumoPresenter:', () {
    late ResumoPresenter presenter;

    setUpAll(() {
      presenter = makeStoreResumoPresenter();
    });

    test('Deveria instanciar um ResumoPresenter', () async {
      expect(presenter, isNotNull);
      expect(presenter, isA<ResumoPresenter>());
    });
  });
}
