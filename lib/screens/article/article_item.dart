import 'package:flutter/material.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({
    this.qiitaInfo,
    this.onPressed,
  });

  final QiitaInfo qiitaInfo;
  final ValueChanged onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => onPressed(
          qiitaInfo,
        ),
        child: SizedBox(
          height: 75,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Image.network(
                    qiitaInfo.qiitaUser.profileImageUrl,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  qiitaInfo.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
