import 'package:flutter/material.dart';
import 'package:qiita_sample/data/entities/article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailScreen extends StatelessWidget {
  ArticleDetailScreen({required this.qiitaInfo});

  final Article qiitaInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Expanded(
          child: Text(
            qiitaInfo.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),
      ),
      body: WebView(
        initialUrl: qiitaInfo.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
