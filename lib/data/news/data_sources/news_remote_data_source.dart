import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_test_task/core/di/di.dart';
import 'package:news_test_task/data/news/api/news_api_client.dart';
import 'package:news_test_task/data/news/dto/top_headlines_dto.dart';

@injectable
class NewsRemoteDataSource {
  final NewsApiClient _apiClient = NewsApiClient(getIt<Dio>());

  Future<TopHeadlinesResponseDto> getTopHeadlines(TopHeadlinesRequestDto body) async {
    try {
      final response = await _apiClient.getTopHeadlines(
        category: body.category?.name,
        query: body.query,
        page: body.page,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
