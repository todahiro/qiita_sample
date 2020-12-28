import 'package:flutter/material.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailScreen extends StatefulWidget {
  ArticleDetailScreen({
    @required this.qiitaInfo,
  });

  final QiitaInfo qiitaInfo;

  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  num position = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Expanded(
          child: Text(
            widget.qiitaInfo.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: position,
        children: [
          WebView(
            initialUrl: widget.qiitaInfo.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (_) {
              setState(() {
                position = 1;
              });
            },
            onPageFinished: (_) {
              setState(() {
                position = 0;
              });
            },
          ),
          Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
