import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_sample/screens/article/article_repository.dart';
import 'package:state_notifier/state_notifier.dart';

import 'article_state.dart';

class ArticleStateNotifier extends StateNotifier<ArticleState> {
  ArticleStateNotifier(this.repository) : super(ArticleState()) {
    getFlutterArticles();
  }

  final ArticleRepository repository;

  Future<void> getFlutterArticles() async {
    try {
      var flutterArticles = await repository.getFlutterArticles();
      state = state.copyWith(
        articles: AsyncValue.data(flutterArticles),
      );
    } on Exception catch (e) {
      state = state.copyWith(
        articles: AsyncValue.error(e),
      );
    }
  }
}
