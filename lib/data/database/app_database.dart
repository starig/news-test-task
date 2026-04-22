import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:news_test_task/data/news/dao/favorite_articles_dao.dart';
import 'package:news_test_task/data/news/tables/favorite_articles_table.dart';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@lazySingleton
@DriftDatabase(
  tables: [FavoriteArticlesTable],
  daos: [FavoriteArticlesDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/app_database.sqlite');
    return NativeDatabase.createInBackground(file);
  });
}
