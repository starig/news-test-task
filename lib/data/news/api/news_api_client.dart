import 'package:dio/dio.dart';
import 'package:news_test_task/data/news/dto/top_headlines_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class NewsApiClient {
  factory NewsApiClient(Dio dio, {String? baseUrl}) = _NewsApiClient;

  @GET('/top-headlines?country=us')
  Future<TopHeadlinesResponseDto> getTopHeadlines({
    @Query('category') String? category,
    @Query('q') String? query,
    @Query('page') int? page,
  });
}
