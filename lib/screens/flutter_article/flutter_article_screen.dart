import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';
import 'package:qiita_sample/screens/flutter_article/flutter_article_item.dart';
import 'package:qiita_sample/screens/flutter_article/flutter_article_screen_model.dart';
import 'package:qiita_sample/screens/qiita_article/article_detail_screen.dart';

class FlutterArticleScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FlutterArticleScreenModel>(context, listen: false);
    Future(() => model.getFlutterArticle());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<FlutterArticleScreenModel>(
            builder: (context, model, child){
              return ListView.builder(
                itemCount: model.articles.length,
                itemBuilder: (context, int position)
                => FlutterArticleItem(
                  qiitaInfo: model.articles[position],
                  onArticleClicked: (qiitaInfo) => _openArticleWebPage(qiitaInfo, context),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _openArticleWebPage(QiitaInfo qiitaInfo, BuildContext context) {
    print("_openArticleWebPage: ${qiitaInfo.url}");
    Navigator.of(context).push (
      MaterialPageRoute(
        builder: (context) => ArticleDetailScreen(
          qiitaInfo: qiitaInfo,
        )
      )
    );
  }
}
