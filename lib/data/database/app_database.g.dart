// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoriteArticlesTableTable extends FavoriteArticlesTable
    with TableInfo<$FavoriteArticlesTableTable, FavoriteArticlesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteArticlesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceNameMeta = const VerificationMeta(
    'sourceName',
  );
  @override
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
    'source_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlToImageMeta = const VerificationMeta(
    'urlToImage',
  );
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
    'url_to_image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publishedAtMeta = const VerificationMeta(
    'publishedAt',
  );
  @override
  late final GeneratedColumn<String> publishedAt = GeneratedColumn<String>(
    'published_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    url,
    sourceId,
    sourceName,
    author,
    title,
    description,
    urlToImage,
    publishedAt,
    content,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_articles_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteArticlesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    }
    if (data.containsKey('source_name')) {
      context.handle(
        _sourceNameMeta,
        sourceName.isAcceptableOrUnknown(data['source_name']!, _sourceNameMeta),
      );
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
        _urlToImageMeta,
        urlToImage.isAcceptableOrUnknown(
          data['url_to_image']!,
          _urlToImageMeta,
        ),
      );
    }
    if (data.containsKey('published_at')) {
      context.handle(
        _publishedAtMeta,
        publishedAt.isAcceptableOrUnknown(
          data['published_at']!,
          _publishedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {url};
  @override
  FavoriteArticlesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteArticlesTableData(
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      ),
      sourceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_name'],
      ),
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      urlToImage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url_to_image'],
      ),
      publishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}published_at'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
    );
  }

  @override
  $FavoriteArticlesTableTable createAlias(String alias) {
    return $FavoriteArticlesTableTable(attachedDatabase, alias);
  }
}

class FavoriteArticlesTableData extends DataClass
    implements Insertable<FavoriteArticlesTableData> {
  final String url;
  final String? sourceId;
  final String? sourceName;
  final String? author;
  final String title;
  final String? description;
  final String? urlToImage;
  final String publishedAt;
  final String? content;
  const FavoriteArticlesTableData({
    required this.url,
    this.sourceId,
    this.sourceName,
    this.author,
    required this.title,
    this.description,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    if (!nullToAbsent || sourceName != null) {
      map['source_name'] = Variable<String>(sourceName);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || urlToImage != null) {
      map['url_to_image'] = Variable<String>(urlToImage);
    }
    map['published_at'] = Variable<String>(publishedAt);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    return map;
  }

  FavoriteArticlesTableCompanion toCompanion(bool nullToAbsent) {
    return FavoriteArticlesTableCompanion(
      url: Value(url),
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      sourceName: sourceName == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceName),
      author: author == null && nullToAbsent
          ? const Value.absent()
          : Value(author),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      urlToImage: urlToImage == null && nullToAbsent
          ? const Value.absent()
          : Value(urlToImage),
      publishedAt: Value(publishedAt),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
    );
  }

  factory FavoriteArticlesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteArticlesTableData(
      url: serializer.fromJson<String>(json['url']),
      sourceId: serializer.fromJson<String?>(json['sourceId']),
      sourceName: serializer.fromJson<String?>(json['sourceName']),
      author: serializer.fromJson<String?>(json['author']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      urlToImage: serializer.fromJson<String?>(json['urlToImage']),
      publishedAt: serializer.fromJson<String>(json['publishedAt']),
      content: serializer.fromJson<String?>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'url': serializer.toJson<String>(url),
      'sourceId': serializer.toJson<String?>(sourceId),
      'sourceName': serializer.toJson<String?>(sourceName),
      'author': serializer.toJson<String?>(author),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'urlToImage': serializer.toJson<String?>(urlToImage),
      'publishedAt': serializer.toJson<String>(publishedAt),
      'content': serializer.toJson<String?>(content),
    };
  }

  FavoriteArticlesTableData copyWith({
    String? url,
    Value<String?> sourceId = const Value.absent(),
    Value<String?> sourceName = const Value.absent(),
    Value<String?> author = const Value.absent(),
    String? title,
    Value<String?> description = const Value.absent(),
    Value<String?> urlToImage = const Value.absent(),
    String? publishedAt,
    Value<String?> content = const Value.absent(),
  }) => FavoriteArticlesTableData(
    url: url ?? this.url,
    sourceId: sourceId.present ? sourceId.value : this.sourceId,
    sourceName: sourceName.present ? sourceName.value : this.sourceName,
    author: author.present ? author.value : this.author,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    urlToImage: urlToImage.present ? urlToImage.value : this.urlToImage,
    publishedAt: publishedAt ?? this.publishedAt,
    content: content.present ? content.value : this.content,
  );
  FavoriteArticlesTableData copyWithCompanion(
    FavoriteArticlesTableCompanion data,
  ) {
    return FavoriteArticlesTableData(
      url: data.url.present ? data.url.value : this.url,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      sourceName: data.sourceName.present
          ? data.sourceName.value
          : this.sourceName,
      author: data.author.present ? data.author.value : this.author,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      urlToImage: data.urlToImage.present
          ? data.urlToImage.value
          : this.urlToImage,
      publishedAt: data.publishedAt.present
          ? data.publishedAt.value
          : this.publishedAt,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteArticlesTableData(')
          ..write('url: $url, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    url,
    sourceId,
    sourceName,
    author,
    title,
    description,
    urlToImage,
    publishedAt,
    content,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteArticlesTableData &&
          other.url == this.url &&
          other.sourceId == this.sourceId &&
          other.sourceName == this.sourceName &&
          other.author == this.author &&
          other.title == this.title &&
          other.description == this.description &&
          other.urlToImage == this.urlToImage &&
          other.publishedAt == this.publishedAt &&
          other.content == this.content);
}

class FavoriteArticlesTableCompanion
    extends UpdateCompanion<FavoriteArticlesTableData> {
  final Value<String> url;
  final Value<String?> sourceId;
  final Value<String?> sourceName;
  final Value<String?> author;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> urlToImage;
  final Value<String> publishedAt;
  final Value<String?> content;
  final Value<int> rowid;
  const FavoriteArticlesTableCompanion({
    this.url = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.content = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoriteArticlesTableCompanion.insert({
    required String url,
    this.sourceId = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.author = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.urlToImage = const Value.absent(),
    required String publishedAt,
    this.content = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : url = Value(url),
       title = Value(title),
       publishedAt = Value(publishedAt);
  static Insertable<FavoriteArticlesTableData> custom({
    Expression<String>? url,
    Expression<String>? sourceId,
    Expression<String>? sourceName,
    Expression<String>? author,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? urlToImage,
    Expression<String>? publishedAt,
    Expression<String>? content,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (url != null) 'url': url,
      if (sourceId != null) 'source_id': sourceId,
      if (sourceName != null) 'source_name': sourceName,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (publishedAt != null) 'published_at': publishedAt,
      if (content != null) 'content': content,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoriteArticlesTableCompanion copyWith({
    Value<String>? url,
    Value<String?>? sourceId,
    Value<String?>? sourceName,
    Value<String?>? author,
    Value<String>? title,
    Value<String?>? description,
    Value<String?>? urlToImage,
    Value<String>? publishedAt,
    Value<String?>? content,
    Value<int>? rowid,
  }) {
    return FavoriteArticlesTableCompanion(
      url: url ?? this.url,
      sourceId: sourceId ?? this.sourceId,
      sourceName: sourceName ?? this.sourceName,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (sourceName.present) {
      map['source_name'] = Variable<String>(sourceName.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<String>(publishedAt.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteArticlesTableCompanion(')
          ..write('url: $url, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteArticlesTableTable favoriteArticlesTable =
      $FavoriteArticlesTableTable(this);
  late final FavoriteArticlesDao favoriteArticlesDao = FavoriteArticlesDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteArticlesTable];
}

typedef $$FavoriteArticlesTableTableCreateCompanionBuilder =
    FavoriteArticlesTableCompanion Function({
      required String url,
      Value<String?> sourceId,
      Value<String?> sourceName,
      Value<String?> author,
      required String title,
      Value<String?> description,
      Value<String?> urlToImage,
      required String publishedAt,
      Value<String?> content,
      Value<int> rowid,
    });
typedef $$FavoriteArticlesTableTableUpdateCompanionBuilder =
    FavoriteArticlesTableCompanion Function({
      Value<String> url,
      Value<String?> sourceId,
      Value<String?> sourceName,
      Value<String?> author,
      Value<String> title,
      Value<String?> description,
      Value<String?> urlToImage,
      Value<String> publishedAt,
      Value<String?> content,
      Value<int> rowid,
    });

class $$FavoriteArticlesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteArticlesTableTable> {
  $$FavoriteArticlesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urlToImage => $composableBuilder(
    column: $table.urlToImage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteArticlesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteArticlesTableTable> {
  $$FavoriteArticlesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urlToImage => $composableBuilder(
    column: $table.urlToImage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteArticlesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteArticlesTableTable> {
  $$FavoriteArticlesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get urlToImage => $composableBuilder(
    column: $table.urlToImage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $$FavoriteArticlesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteArticlesTableTable,
          FavoriteArticlesTableData,
          $$FavoriteArticlesTableTableFilterComposer,
          $$FavoriteArticlesTableTableOrderingComposer,
          $$FavoriteArticlesTableTableAnnotationComposer,
          $$FavoriteArticlesTableTableCreateCompanionBuilder,
          $$FavoriteArticlesTableTableUpdateCompanionBuilder,
          (
            FavoriteArticlesTableData,
            BaseReferences<
              _$AppDatabase,
              $FavoriteArticlesTableTable,
              FavoriteArticlesTableData
            >,
          ),
          FavoriteArticlesTableData,
          PrefetchHooks Function()
        > {
  $$FavoriteArticlesTableTableTableManager(
    _$AppDatabase db,
    $FavoriteArticlesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteArticlesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$FavoriteArticlesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FavoriteArticlesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> url = const Value.absent(),
                Value<String?> sourceId = const Value.absent(),
                Value<String?> sourceName = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> urlToImage = const Value.absent(),
                Value<String> publishedAt = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteArticlesTableCompanion(
                url: url,
                sourceId: sourceId,
                sourceName: sourceName,
                author: author,
                title: title,
                description: description,
                urlToImage: urlToImage,
                publishedAt: publishedAt,
                content: content,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String url,
                Value<String?> sourceId = const Value.absent(),
                Value<String?> sourceName = const Value.absent(),
                Value<String?> author = const Value.absent(),
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String?> urlToImage = const Value.absent(),
                required String publishedAt,
                Value<String?> content = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteArticlesTableCompanion.insert(
                url: url,
                sourceId: sourceId,
                sourceName: sourceName,
                author: author,
                title: title,
                description: description,
                urlToImage: urlToImage,
                publishedAt: publishedAt,
                content: content,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteArticlesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteArticlesTableTable,
      FavoriteArticlesTableData,
      $$FavoriteArticlesTableTableFilterComposer,
      $$FavoriteArticlesTableTableOrderingComposer,
      $$FavoriteArticlesTableTableAnnotationComposer,
      $$FavoriteArticlesTableTableCreateCompanionBuilder,
      $$FavoriteArticlesTableTableUpdateCompanionBuilder,
      (
        FavoriteArticlesTableData,
        BaseReferences<
          _$AppDatabase,
          $FavoriteArticlesTableTable,
          FavoriteArticlesTableData
        >,
      ),
      FavoriteArticlesTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteArticlesTableTableTableManager get favoriteArticlesTable =>
      $$FavoriteArticlesTableTableTableManager(_db, _db.favoriteArticlesTable);
}
