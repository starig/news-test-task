import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_test_task/core/enums/category_enum.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';
import 'package:news_test_task/domain/news/entities/top_headlines_entity.dart';
import 'package:news_test_task/domain/news/use_cases/get_top_headlines_use_case.dart';

part 'news_state.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._getTopHeadlinesUseCase)
    : super(
        NewsState(
          isLoading: false,
          isLoadingMore: false,
          hasMore: true,
          page: 1,
          articles: [],
          selectedCategory: null,
        ),
      );

  final GetTopHeadlinesUseCase _getTopHeadlinesUseCase;

  Future<void> getTopHeadlines() async {
    if (state.isLoading) return;

    emit(
      state.copyWith(
        isLoading: true,
        isLoadingMore: false,
        hasMore: true,
        page: 1,
      ),
    );

    try {
      final body = TopHeadlinesRequestEntity(
        page: 1,
        category: state.selectedCategory,
      );
      final response = await _getTopHeadlinesUseCase(body);
      final hasMore = response.articles.length < response.totalResults && response.articles.isNotEmpty;

      emit(
        state.copyWith(
          isLoading: false,
          articles: response.articles,
          hasMore: hasMore,
          page: 1,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      if (kDebugMode) {
        inspect(e);
      }
    }
  }

  Future<void> loadMoreTopHeadlines() async {
    if (state.isLoading || state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.page + 1;
    try {
      final body = TopHeadlinesRequestEntity(
        page: nextPage,
        category: state.selectedCategory,
      );
      final response = await _getTopHeadlinesUseCase(body);

      final mergedArticles = [...state.articles, ...response.articles];
      final hasMore = mergedArticles.length < response.totalResults && response.articles.isNotEmpty;

      emit(
        state.copyWith(
          isLoadingMore: false,
          articles: mergedArticles,
          page: nextPage,
          hasMore: hasMore,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false));
      if (kDebugMode) {
        inspect(e);
      }
    }
  }

  Future<void> selectCategory(CategoryEnum category) async {
    if (state.selectedCategory == category) return;

    emit(state.copyWith(selectedCategory: category));
    await getTopHeadlines();
  }
}
