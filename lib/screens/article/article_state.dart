import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';

part 'article_state.freezed.dart';

part 'article_state.g.dart';

@freezed
abstract class ArticleState with _$ArticleState {
  const factory ArticleState({@Default([]) List<QiitaInfo> articles}) = _ArticleState;

  factory ArticleState.fromJson(Map<String, dynamic> json) =>
      _$ArticleStateFromJson(json);
}
