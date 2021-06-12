import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_sample/data/entities/article.dart';
import 'package:qiita_sample/screens/article/article_item.dart';
import 'package:qiita_sample/screens/article/article_repository.dart';
import 'package:qiita_sample/screens/article/article_state_notifier.dart';
import 'package:qiita_sample/screens/article_detail/article_detail_screen.dart';

import 'article_state.dart';

final articleProvider =
    StateNotifierProvider<ArticleStateNotifier, ArticleState>(
  (_) => ArticleStateNotifier(
    ArticleRepository(),
  ),
);

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

class _List extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(articleProvider);
    return RefreshIndicator(
      child: state.articles.when(
        data: (articles) => ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, int position) => ArticleItem(
            qiitaInfo: articles[position],
            onArticleClicked: (qiitaInfo) => _openArticleWebPage(
              context,
              qiitaInfo,
            ),
          ),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (_, __) => Center(
          child: Text('データの取得に失敗しました。'),
        ),
      ),
      onRefresh: () => getArticle(context),
    );
  }

  void _openArticleWebPage(
    BuildContext context,
    Article qiitaInfo,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArticleDetailScreen(
          qiitaInfo: qiitaInfo,
        ),
      ),
    );
  }

  Future<void> getArticle(BuildContext context) async {
    await context.read(articleProvider.notifier).getFlutterArticles();
  }
}
