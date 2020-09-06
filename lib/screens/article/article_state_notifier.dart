import 'package:qiita_sample/screens/article/article_repository.dart';
import 'package:state_notifier/state_notifier.dart';

import 'article_state.dart';

class ArticleStateNotifier extends StateNotifier<ArticleState> with LocatorMixin {
  ArticleStateNotifier(this.repository)
      : super(
          const ArticleState(),
        );
  final ArticleRepository repository;

  @override
  void initState() {
    super.initState();

    _getFlutterArticles();
  }

  Future<void> _getFlutterArticles() async {
    var flutterArticles = await repository.getFlutterArticles();
    state = state.copyWith(
      articles: flutterArticles,
    );
  }
}
