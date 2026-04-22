import 'package:injectable/injectable.dart';
import 'package:news_test_task/domain/news/repository/news_repository.dart';

@injectable
class RemoveFavoriteArticleUseCase {
  final NewsRepository _repository;

  RemoveFavoriteArticleUseCase(this._repository);

  Future<void> call(String url) async {
    await _repository.removeFavoriteArticle(url);
  }
}
