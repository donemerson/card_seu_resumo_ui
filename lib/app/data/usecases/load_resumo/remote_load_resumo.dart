import '../../../data/data.dart';
import '../../../domain/domain.dart';

class RemoteLoadResumo implements LoadResumo {
  final GraphQLClient graphQLClient;
  final String url;

  RemoteLoadResumo({required this.graphQLClient, required this.url});

  @override
  Future<List<ResumoEntity>> getResumos() async {
    try {
      final httpResponse = await graphQLClient.request(
        url: url,
        query:
            "query { wealthSummary { cdi gain id hasHistory profitability total } }",
      );
      if (httpResponse['data'] == null ||
          httpResponse['data']['wealthSummary'] == null) {
        throw DomainError.unexpected;
      }
      final _data = httpResponse['data']['wealthSummary'];
      final _lista = <RemoteResumoModel>[];

      // Percorrendo pela lista e criando os model
      if (_data is List) {
        for (final e in _data) {
          final _resumoRemoteModel = RemoteResumoModel.fromJson(e);
          _lista.add(_resumoRemoteModel);
        }
      }

      // Convertendo model para entity
      return _lista.map((e) => e.toEntity()).toList();
    } on HttpError catch (_) {
      throw DomainError.unexpected;
    }
  }
}
