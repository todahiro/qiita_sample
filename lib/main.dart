import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_sample/screens/article/article_screen.dart';

void main() => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiita Sample',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF55c500),
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: ArticleScreen(),
    );
  }
}
