import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';
import 'package:qiita_sample/screens/article/article_item.dart';
import 'package:qiita_sample/screens/article/article_state.dart';
import 'package:qiita_sample/screens/article_detail/article_detail_screen.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Qiita Sample',
        ),
        centerTitle: true,
      ),
      body: _List(),
    );
  }
}

class _List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articles = context.select((ArticleState state) => state.articles);
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, int position) => ArticleItem(
        qiitaInfo: articles[position],
        onArticleClicked: (qiitaInfo) => _openArticleWebPage(
          context,
          qiitaInfo,
        ),
      ),
    );
  }

  _openArticleWebPage(
      BuildContext context,
      QiitaInfo qiitaInfo,
      ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArticleDetailScreen(
          qiitaInfo: qiitaInfo,
        ),
      ),
    );
  }
}
