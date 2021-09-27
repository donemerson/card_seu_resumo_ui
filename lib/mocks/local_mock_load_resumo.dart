import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';

class LocalMockLoadResumo {
  static final Client httpClient = MockClient((request) async {
    await Future.delayed(Duration(milliseconds: 1000));
    return Response(jsonEncode(LocalMockLoadResumo.listaResumoJson), 200,
        request: request);
  });

  static const listaResumoJson = <String, dynamic>{
    "data": {
      'wealthSummary': [
        {
          "id": 10,
          "cdi": 3.45,
          "gain": 1833.23,
          "hasHistory": false,
          "profitability": 2.767,
          "total": 3200876.00
        },
        {
          "id": 30,
          "cdi": 1.235,
          "gain": 12545,
          "hasHistory": true,
          "profitability": 225,
          "total": 122184
        },
        {
          "id": 31,
          "cdi": 2.9855,
          "gain": 125,
          "hasHistory": false,
          "profitability": 12488,
          "total": 4915514
        },
        {
          "id": 32,
          "cdi": 12.8889,
          "gain": 1548,
          "hasHistory": false,
          "profitability": 158478,
          "total": 1158
        },
        {
          "id": 33,
          "cdi": 11.777,
          "gain": 1487845,
          "hasHistory": false,
          "profitability": 18.88,
          "total": 154848
        },
        {
          "id": 34,
          "cdi": 12,
          "gain": 154848,
          "hasHistory": true,
          "profitability": 5,
          "total": 124848
        }
      ]
    }
  };

  static const resumoJson = <String, dynamic>{
    "id": 34,
    "cdi": 12,
    "gain": 154848,
    "hasHistory": true,
    "profitability": 5,
    "total": 124848
  };
}
