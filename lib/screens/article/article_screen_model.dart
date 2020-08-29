import 'package:flutter/cupertino.dart';
import 'package:qiita_sample/data/api/qiita_api_client.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';

class ArticleScreenModel extends ChangeNotifier {
  final api = QiitaApiClient.create();
  List<QiitaInfo> _articles = List();

  List<QiitaInfo> get articles => _articles;

  Future<void> getFlutterArticle() async {
    _articles = await api.getFlutterArticles();
    notifyListeners();
  }
}
