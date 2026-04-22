import 'package:injectable/injectable.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';
import 'package:news_test_task/domain/news/repository/news_repository.dart';

@injectable
class GetFavoriteArticlesUseCase {
  final NewsRepository _repository;

  GetFavoriteArticlesUseCase(this._repository);

  Future<List<ArticleEntity>> call() async {
    return await _repository.getFavoriteArticles();
  }
}
