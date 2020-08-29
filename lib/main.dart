import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:qiita_sample/screens/flutter_article/flutter_article_screen.dart';
import 'package:qiita_sample/screens/flutter_article/flutter_article_screen_model.dart';

void main() {
  _setupLogging();
  runApp(
      ChangeNotifierProvider<FlutterArticleScreenModel>(
        create: (context) => FlutterArticleScreenModel(),
        child: MyApp(),
      )
  );
}

void _setupLogging() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiita Sample',
      theme: ThemeData(
          brightness: Brightness.dark,
      ),
      home: FlutterArticleScreen(),
    );
  }
}
