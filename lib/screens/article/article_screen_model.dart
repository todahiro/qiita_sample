import 'package:flutter/cupertino.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';
import 'package:qiita_sample/screens/article/article_repository.dart';

class ArticleScreenModel extends ChangeNotifier {

  final ArticleRepository _repository = ArticleRepository();

  List<QiitaInfo> _articles = List();
  List<QiitaInfo> get articles => _articles;

  Future<void> getFlutterArticle() async {
    _articles = await _repository.getFlutterArticle();
    notifyListeners();
  }
}
