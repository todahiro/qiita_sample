import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';

class ArticleDetailScreen extends StatefulWidget {
  ArticleDetailScreen({
    @required this.qiitaInfo,
  });

  final QiitaInfo qiitaInfo;

  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.qiitaInfo.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ),
      body: Column(
        children: [
          progress < 1.0 ? LinearProgressIndicator(value: progress) : SizedBox.shrink(),
          Expanded(
            child: InAppWebView(
              initialUrl: widget.qiitaInfo.url,
              onProgressChanged: (InAppWebViewController controller, int progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
