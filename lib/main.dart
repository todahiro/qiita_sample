import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:qiita_sample/screens/article/article_repository.dart';
import 'package:qiita_sample/screens/article/article_screen.dart';
import 'package:qiita_sample/screens/article/article_state.dart';
import 'package:qiita_sample/screens/article/article_state_notifier.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiita Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StateNotifierProvider<ArticleStateNotifier, ArticleState>(
        create: (_) => ArticleStateNotifier(
          ArticleRepository(),
        ),
        child: ArticleScreen(),
      ),
    );
  }
}
