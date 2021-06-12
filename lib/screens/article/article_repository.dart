import 'package:qiita_sample/data/api/qiita_api_client.dart';
import 'package:qiita_sample/data/entities/article.dart';

class ArticleRepository {
  final _api = QiitaApiClient.create();
  Future<List<Article>> getFlutterArticles() async {
    return await _api.getFlutterArticles();
  }
}