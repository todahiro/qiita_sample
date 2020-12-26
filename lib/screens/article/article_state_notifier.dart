import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';
import 'package:qiita_sample/screens/article/article_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class ArticleStateNotifier extends StateNotifier<AsyncValue<List<QiitaInfo>>> {
  ArticleStateNotifier(this.repository) : super(const AsyncValue.loading()) {
    _getFlutterArticles();
  }

  final ArticleRepository repository;

  Future<void> _getFlutterArticles() async {
    try {
      final articles = await repository.getFlutterArticles();
      state = AsyncValue.data(articles);
    } on Exception catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
