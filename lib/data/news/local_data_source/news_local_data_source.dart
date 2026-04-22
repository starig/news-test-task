import 'package:injectable/injectable.dart';
import 'package:news_test_task/data/news/dao/favorite_articles_dao.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';

@injectable
class NewsLocalDataSource {
  final FavoriteArticlesDao _favoriteArticlesDao;

  NewsLocalDataSource(this._favoriteArticlesDao);

  Future<void> addFavoriteArticle(ArticleEntity article) async {
    await _favoriteArticlesDao.addFavoriteArticle(article);
  }

  Future<void> removeFavoriteArticle(String url) async {
    await _favoriteArticlesDao.removeFavoriteArticle(url);
  }

  Future<List<ArticleEntity>> getFavoriteArticles() async {
    return _favoriteArticlesDao.getFavoriteArticles();
  }
}
