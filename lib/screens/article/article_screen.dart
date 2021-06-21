import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_sample/data/entities/article.dart';
import 'package:qiita_sample/screens/article/article_item.dart';
import 'package:qiita_sample/screens/article/article_repository.dart';
import 'package:qiita_sample/screens/article/article_state_notifier.dart';
import 'package:qiita_sample/screens/article_detail/article_detail_screen.dart';

import 'article_state.dart';

final ScrollController _scrollViewController = ScrollController();
final articleProvider =
    StateNotifierProvider<ArticleStateNotifier, ArticleState>(
  (_) => ArticleStateNotifier(
    ArticleRepository(),
    _scrollViewController,
  ),
);

class ArticleScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(articleProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AnimatedContainer(
              height: state.showAppbar ? 56.0 : 0.0,
              duration: Duration(milliseconds: 200),
              child: AppBar(
                title: Text('Qiita Sample'),
                actions: <Widget>[
                  //add buttons here
                ],
              ),
            ),
            Expanded(
              child: _List(scrollController: _scrollViewController),
            ),
          ],
        ),
      ),
    );
  }
}

class _List extends HookWidget {
  _List({
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final state = useProvider(articleProvider);
    return RefreshIndicator(
      child: state.articles.when(
        data: (articles) => ListView.builder(
          controller: scrollController,
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
