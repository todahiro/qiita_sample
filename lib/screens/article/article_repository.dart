import 'package:qiita_sample/data/api/qiita_api_client.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';

class ArticleRepository {
  final _api = QiitaApiClient.create();
  Future<List<QiitaInfo>> getFlutterArticle() async {
    return await _api.getFlutterArticles();
  }
}