import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui/pages/pages.dart';
import 'resumo_presenter_factory.dart';

Widget makeResumoPage() => Provider(
      create: (_) => makeStoreResumoPresenter(),
      child: Builder(
        builder: (context) => ResumoPage(
          presenter: Provider.of<ResumoPresenter>(context),
        ),
      ),
    );
