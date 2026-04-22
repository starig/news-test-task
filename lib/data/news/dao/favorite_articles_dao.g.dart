// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_articles_dao.dart';

// ignore_for_file: type=lint
mixin _$FavoriteArticlesDaoMixin on DatabaseAccessor<AppDatabase> {
  $FavoriteArticlesTableTable get favoriteArticlesTable =>
      attachedDatabase.favoriteArticlesTable;
  FavoriteArticlesDaoManager get managers => FavoriteArticlesDaoManager(this);
}

class FavoriteArticlesDaoManager {
  final _$FavoriteArticlesDaoMixin _db;
  FavoriteArticlesDaoManager(this._db);
  $$FavoriteArticlesTableTableTableManager get favoriteArticlesTable =>
      $$FavoriteArticlesTableTableTableManager(
        _db.attachedDatabase,
        _db.favoriteArticlesTable,
      );
}
