import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_sample/data/entities/article.dart';

part 'article_state.freezed.dart';

@freezed
class ArticleState with _$ArticleState {
  const factory ArticleState({
    @Default(AsyncValue.loading()) AsyncValue<List<Article>> articles,
  }) = _ArticleState;
}
