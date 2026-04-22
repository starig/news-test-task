import 'package:injectable/injectable.dart';
import 'package:news_test_task/data/news/local_data_source/news_local_data_source.dart';
import 'package:news_test_task/data/news/data_sources/news_remote_data_source.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';
import 'package:news_test_task/domain/news/entities/top_headlines_entity.dart';

@injectable
class NewsRepository {
  final NewsRemoteDataSource _remoteDataSource;
  final NewsLocalDataSource _localDataSource;

  NewsRepository(this._remoteDataSource, this._localDataSource);

  Future<TopHeadlinesResponseEntity> getTopHeadlines(TopHeadlinesRequestEntity body) async {
    try {
      final response = await _remoteDataSource.getTopHeadlines(body.toDto());
      return response.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addFavoriteArticle(ArticleEntity article) async {
    try {
      await _localDataSource.addFavoriteArticle(article);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFavoriteArticle(String url) async {
    try {
      await _localDataSource.removeFavoriteArticle(url);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ArticleEntity>> getFavoriteArticles() async {
    try {
      return await _localDataSource.getFavoriteArticles();
    } catch (e) {
      rethrow;
    }
  }
}
