import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_sample/screens/article/article_repository.dart';
import 'package:state_notifier/state_notifier.dart';

import 'article_state.dart';

class ArticleStateNotifier extends StateNotifier<ArticleState> {
  ArticleStateNotifier(this.repository, this.scrollController) : super(ArticleState()) {
    getFlutterArticles();
    scrollController.addListener(() {
      decideShowAppBar();
    });
  }

  final ArticleRepository repository;
  final ScrollController scrollController;

  Future<void> getFlutterArticles() async {
    try {
      var flutterArticles = await repository.getFlutterArticles();
      state = state.copyWith(
        articles: AsyncValue.data(flutterArticles),
      );
    } on Exception catch (e) {
      state = state.copyWith(
        articles: AsyncValue.error(e),
      );
    }
  }

  void decideShowAppBar() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!state.isScrollingDown) {
        state = state.copyWith(
          isScrollingDown: true,
          showAppbar: false,
        );
      }
    }

    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (state.isScrollingDown) {
        state = state.copyWith(
          isScrollingDown: false,
          showAppbar: true,
        );
      }
    }
  }
}
