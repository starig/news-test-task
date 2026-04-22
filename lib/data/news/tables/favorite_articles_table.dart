import 'package:drift/drift.dart';

class FavoriteArticlesTable extends Table {
  TextColumn get url => text()();

  TextColumn get sourceId => text().nullable()();

  TextColumn get sourceName => text().nullable()();

  TextColumn get author => text().nullable()();

  TextColumn get title => text()();

  TextColumn get description => text().nullable()();

  TextColumn get urlToImage => text().nullable()();

  TextColumn get publishedAt => text()();

  TextColumn get content => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {url};
}
