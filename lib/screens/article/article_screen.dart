import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';
import 'package:qiita_sample/screens/article/article_item.dart';
import 'package:qiita_sample/screens/article/article_screen_model.dart';
import 'package:qiita_sample/screens/article_detail/article_detail_screen.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ArticleScreenModel>(
      context,
      listen: false,
    );
    Future(
      () => model.getFlutterArticle(),
    );

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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Consumer<ArticleScreenModel>(
        builder: (context, model, child) {
          return ListView.builder(
            itemCount: model.articles.length,
            itemBuilder: (context, int position) => ArticleItem(
              qiitaInfo: model.articles[position],
              onArticleClicked: (qiitaInfo) => _openArticleWebPage(
                context,
                qiitaInfo,
              ),
            ),
          );
        },
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
