import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';
import 'package:qiita_sample/screens/article/article_item.dart';
import 'package:qiita_sample/screens/article/article_repository.dart';
import 'package:qiita_sample/screens/article/article_state.dart';
import 'package:qiita_sample/screens/article/article_state_notifier.dart';
import 'package:qiita_sample/screens/article_detail/article_detail_screen.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<ArticleStateNotifier, ArticleState>(
      create: (_) {
        return ArticleStateNotifier(
          ArticleRepository(),
        );
      },
      builder: (_, __) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Qiita Sample',
          ),
          centerTitle: true,
        ),
        body: _List(),
      ),
    );
  }
}

class _List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ArticleState>();
    return ListView.builder(
      itemCount: state.articles.length,
      itemBuilder: (context, int position) => ArticleItem(
        qiitaInfo: state.articles[position],
        onArticleClicked: (qiitaInfo) => _openArticleWebPage(
          context,
          qiitaInfo,
        ),
      ),
    );
  }

  void _openArticleWebPage(
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
