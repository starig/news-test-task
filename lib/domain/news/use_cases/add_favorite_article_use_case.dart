import 'package:injectable/injectable.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';
import 'package:news_test_task/domain/news/repository/news_repository.dart';

@injectable
class AddFavoriteArticleUseCase {
  final NewsRepository _repository;

  AddFavoriteArticleUseCase(this._repository);

  Future<void> call(ArticleEntity article) async {
    await _repository.addFavoriteArticle(article);
  }
}
