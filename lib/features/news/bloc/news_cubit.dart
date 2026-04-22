import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';
import 'package:news_test_task/domain/news/entities/top_headlines_entity.dart';
import 'package:news_test_task/domain/news/use_cases/get_top_headlines_use_case.dart';

part 'news_state.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._getTopHeadlinesUseCase)
    : super(
        NewsState(
          isLoadingMore: false,
          page: 0,
          articles: [],
        ),
      );

  final GetTopHeadlinesUseCase _getTopHeadlinesUseCase;

  Future<void> getTopHeadlines() async {
    try {
      final body = TopHeadlinesRequestEntity();
      final response = await _getTopHeadlinesUseCase(body);
      emit(state.copyWith(articles: response.articles));
    } catch (e) {
      if (kDebugMode) {
        inspect(e);
      }
    }
  }
}
