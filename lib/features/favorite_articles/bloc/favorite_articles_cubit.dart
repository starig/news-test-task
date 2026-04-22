import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';
import 'package:news_test_task/domain/news/use_cases/add_favorite_article_use_case.dart';
import 'package:news_test_task/domain/news/use_cases/get_favorite_articles_use_case.dart';
import 'package:news_test_task/domain/news/use_cases/remove_favorite_article_use_case.dart';

part 'favorite_articles_state.dart';

@injectable
class FavoriteArticlesCubit extends Cubit<FavoriteArticlesState> {
  FavoriteArticlesCubit(
    this._getFavoriteArticlesUseCase,
    this._addFavoriteArticleUseCase,
    this._removeFavoriteArticleUseCase,
  ) : super(
        FavoriteArticlesState(
          favoriteArticles: [],
          errorMessage: null,
          errorEventId: 0,
        ),
      );

  final GetFavoriteArticlesUseCase _getFavoriteArticlesUseCase;
  final AddFavoriteArticleUseCase _addFavoriteArticleUseCase;
  final RemoveFavoriteArticleUseCase _removeFavoriteArticleUseCase;

  Future<void> getFavoriteArticles() async {
    try {
      final favoriteArticles = await _getFavoriteArticlesUseCase();
      emit(
        state.copyWith(
          favoriteArticles: favoriteArticles,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to load favorite articles. Please try again.',
          errorEventId: state.errorEventId + 1,
        ),
      );
      if (kDebugMode) {
        inspect(e);
      }
    }
  }

  Future<void> addFavoriteArticle(ArticleEntity article) async {
    try {
      await _addFavoriteArticleUseCase(article);
      final alreadyInFavorites = state.favoriteArticlesUrls.contains(article.url);
      if (alreadyInFavorites) return;
      final updatedFavorites = [...state.favoriteArticles, article];
      emit(
        state.copyWith(
          favoriteArticles: updatedFavorites,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to add article to favorites. Please try again.',
          errorEventId: state.errorEventId + 1,
        ),
      );
      if (kDebugMode) {
        inspect(e);
      }
    }
  }

  Future<void> removeFavoriteArticle(String url) async {
    try {
      await _removeFavoriteArticleUseCase(url);
      final updatedFavorites = state.favoriteArticles.where((element) => element.url != url).toList();
      emit(
        state.copyWith(
          favoriteArticles: updatedFavorites,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to remove article from favorites. Please try again.',
          errorEventId: state.errorEventId + 1,
        ),
      );
      if (kDebugMode) {
        inspect(e);
      }
    }
  }
}
