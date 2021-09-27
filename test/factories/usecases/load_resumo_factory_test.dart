import 'package:card_seu_resumo_ui/app/domain/domain.dart';
import 'package:card_seu_resumo_ui/app/factories/usercases/load_resumo_factory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory Make LoadResumo:', () {
    late LoadResumo usercase;
    setUpAll(() {
      usercase = makeRemoteLoadResumo();
    });
    test('Deveria instanciar um caso de uso tipo LoadResumo', () async {
      expect(usercase, isNotNull);
      expect(usercase, isA<LoadResumo>());
    });
  });
}
