import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiita_sample/screens/article/article_screen.dart';
import 'package:qiita_sample/screens/article/article_screen_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ArticleScreenModel>(
      create: (context) => ArticleScreenModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiita Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArticleScreen(),
    );
  }
}
