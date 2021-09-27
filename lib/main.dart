import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../app/ui/ui.dart';
import '../app/factories/factories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await R.load();
  mainContext.spy((event) {
    print(event);
  });
  // inicializando banco de dados offline-first
  final db = makeDBAdapter();
  await db.initDB();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fliper',
      theme: makeAppTheme(),
      routes: {
        '/': (_) => makeResumoPage(),
      },
      initialRoute: '/',
    );
  }
}
