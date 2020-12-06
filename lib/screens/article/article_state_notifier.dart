import 'package:qiita_sample/screens/article/article_repository.dart';
import 'package:state_notifier/state_notifier.dart';

import 'article_state.dart';

class ArticleStateNotifier extends StateNotifier<ArticleState> {
  ArticleStateNotifier(this.repository) : super(ArticleState()) {
    _getFlutterArticles();
  }

  final ArticleRepository repository;

  Future<void> _getFlutterArticles() async {
    var flutterArticles = await repository.getFlutterArticles();
    state = state.copyWith(
      articles: flutterArticles,
    );
  }
}
