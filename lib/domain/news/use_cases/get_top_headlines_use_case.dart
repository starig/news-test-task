import 'package:injectable/injectable.dart';
import 'package:news_test_task/domain/news/entities/top_headlines_entity.dart';
import 'package:news_test_task/domain/news/repository/news_repository.dart';

@injectable
class GetTopHeadlinesUseCase {
  final NewsRepository _repository;
  GetTopHeadlinesUseCase(this._repository);

  Future<TopHeadlinesResponseEntity> call(TopHeadlinesRequestEntity body) async {
    return await _repository.getTopHeadlines(body);
  }
}
