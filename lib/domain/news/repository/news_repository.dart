import 'package:injectable/injectable.dart';
import 'package:news_test_task/data/news/data_sources/news_remote_data_source.dart';
import 'package:news_test_task/domain/news/entities/top_headlines_entity.dart';

@injectable
class NewsRepository {
  final NewsRemoteDataSource _remoteDataSource;

  NewsRepository(this._remoteDataSource);

  Future<TopHeadlinesResponseEntity> getTopHeadlines(TopHeadlinesRequestEntity body) async {
    try {
      final response = await _remoteDataSource.getTopHeadlines(body.toDto());
      return response.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
