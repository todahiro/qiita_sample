import 'package:flutter/material.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';

class FlutterArticleItem extends StatelessWidget {
  final QiitaInfo qiitaInfo;
  final ValueChanged onArticleClicked;

  FlutterArticleItem({this.qiitaInfo, this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () => onArticleClicked(qiitaInfo),
        child: SizedBox(
          height: 75,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(qiitaInfo.qiitaUser.profileImageUrl),
                )
              ),
              Expanded(
                flex: 4,
                child: Text(qiitaInfo.title)
              )
            ],
          ),
        ),
      ),
    );
  }
}
