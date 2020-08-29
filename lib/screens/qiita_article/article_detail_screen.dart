import 'package:flutter/material.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailScreen extends StatelessWidget {
  ArticleDetailScreen({@required this.qiitaInfo});
  final QiitaInfo qiitaInfo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: qiitaInfo.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}