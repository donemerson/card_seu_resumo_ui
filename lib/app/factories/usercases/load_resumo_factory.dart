import 'package:card_seu_resumo_ui/app/infra/graphql/graphql.dart';
import 'package:card_seu_resumo_ui/mocks/local_mock_load_resumo.dart';

import '../graphql/graphql.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';

const _offline = bool.fromEnvironment('offline');
const _endpoint = "https://harura-fliper-test.herokuapp.com/v1/graphql";
LoadResumo makeRemoteLoadResumo() {
  late GraphQLClient graphQLClient;

  if (_offline) {
    graphQLClient = GraphQLAdapter(LocalMockLoadResumo.httpClient);
  } else {
    graphQLClient = makeGraphQLAdapterHasuraCache();
  }

  return RemoteLoadResumo(
    graphQLClient: graphQLClient,
    url: _endpoint,
  );
}
