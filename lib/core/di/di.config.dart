// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_test_task/core/di/core_module.dart' as _i690;
import 'package:news_test_task/data/news/dao/favorite_articles_dao.dart'
    as _i431;
import 'package:news_test_task/data/news/data_sources/news_remote_data_source.dart'
    as _i937;
import 'package:news_test_task/data/news/local_data_source/news_local_data_source.dart'
    as _i929;
import 'package:news_test_task/data/news/local_data_source/news_local_database.dart'
    as _i1052;
import 'package:news_test_task/domain/news/repository/news_repository.dart'
    as _i1008;
import 'package:news_test_task/domain/news/use_cases/add_favorite_article_use_case.dart'
    as _i198;
import 'package:news_test_task/domain/news/use_cases/get_favorite_articles_use_case.dart'
    as _i333;
import 'package:news_test_task/domain/news/use_cases/get_top_headlines_use_case.dart'
    as _i525;
import 'package:news_test_task/domain/news/use_cases/remove_favorite_article_use_case.dart'
    as _i345;
import 'package:news_test_task/features/favorite_articles/bloc/favorite_articles_cubit.dart'
    as _i898;
import 'package:news_test_task/features/news/bloc/news_cubit.dart' as _i817;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    gh.factory<_i690.DioFactory>(() => _i690.DioFactory());
    gh.factory<_i937.NewsRemoteDataSource>(() => _i937.NewsRemoteDataSource());
    gh.lazySingleton<_i1052.NewsLocalDatabase>(
      () => _i1052.NewsLocalDatabase(),
    );
    gh.lazySingleton<_i361.Dio>(() => coreModule.dio(gh<_i690.DioFactory>()));
    gh.lazySingleton<_i431.FavoriteArticlesDao>(
      () => _i431.FavoriteArticlesDao(gh<_i1052.NewsLocalDatabase>()),
    );
    gh.factory<_i929.NewsLocalDataSource>(
      () => _i929.NewsLocalDataSource(gh<_i431.FavoriteArticlesDao>()),
    );
    gh.factory<_i1008.NewsRepository>(
      () => _i1008.NewsRepository(
        gh<_i937.NewsRemoteDataSource>(),
        gh<_i929.NewsLocalDataSource>(),
      ),
    );
    gh.factory<_i198.AddFavoriteArticleUseCase>(
      () => _i198.AddFavoriteArticleUseCase(gh<_i1008.NewsRepository>()),
    );
    gh.factory<_i333.GetFavoriteArticlesUseCase>(
      () => _i333.GetFavoriteArticlesUseCase(gh<_i1008.NewsRepository>()),
    );
    gh.factory<_i525.GetTopHeadlinesUseCase>(
      () => _i525.GetTopHeadlinesUseCase(gh<_i1008.NewsRepository>()),
    );
    gh.factory<_i345.RemoveFavoriteArticleUseCase>(
      () => _i345.RemoveFavoriteArticleUseCase(gh<_i1008.NewsRepository>()),
    );
    gh.factory<_i817.NewsCubit>(
      () => _i817.NewsCubit(gh<_i525.GetTopHeadlinesUseCase>()),
    );
    gh.factory<_i898.FavoriteArticlesCubit>(
      () => _i898.FavoriteArticlesCubit(
        gh<_i333.GetFavoriteArticlesUseCase>(),
        gh<_i198.AddFavoriteArticleUseCase>(),
        gh<_i345.RemoveFavoriteArticleUseCase>(),
      ),
    );
    return this;
  }
}

class _$CoreModule extends _i690.CoreModule {}
