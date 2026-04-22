import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:news_test_task/data/database/app_database.dart';
import 'package:news_test_task/data/news/tables/favorite_articles_table.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';

part 'favorite_articles_dao.g.dart';

@DriftAccessor(tables: [FavoriteArticlesTable])
@lazySingleton
class FavoriteArticlesDao extends DatabaseAccessor<AppDatabase> with _$FavoriteArticlesDaoMixin {
  FavoriteArticlesDao(super.db);

  Future<void> addFavoriteArticle(ArticleEntity article) async {
    await into(favoriteArticlesTable).insertOnConflictUpdate(article.toCompanion());
  }

  Future<void> removeFavoriteArticle(String url) async {
    await (delete(favoriteArticlesTable)..where((table) => table.url.equals(url))).go();
  }

  Future<List<ArticleEntity>> getFavoriteArticles() async {
    final rows = await select(favoriteArticlesTable).get();
    return rows.map((row) => row.toEntity()).toList();
  }
}

extension on ArticleEntity {
  FavoriteArticlesTableCompanion toCompanion() {
    return FavoriteArticlesTableCompanion.insert(
      url: url,
      sourceId: Value(source.id),
      sourceName: Value(source.name),
      author: Value(author),
      title: title,
      description: Value(description),
      urlToImage: Value(urlToImage),
      publishedAt: publishedAt,
      content: Value(content),
    );
  }
}

extension on FavoriteArticlesTableData {
  ArticleEntity toEntity() {
    return ArticleEntity(
      source: SourceEntity(
        id: sourceId,
        name: sourceName,
      ),
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }
}
