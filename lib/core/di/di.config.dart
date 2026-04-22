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
import 'package:news_test_task/data/news/data_sources/news_remote_data_source.dart'
    as _i937;
import 'package:news_test_task/domain/news/repository/news_repository.dart'
    as _i1008;
import 'package:news_test_task/domain/news/use_cases/get_top_headlines_use_case.dart'
    as _i525;
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
    gh.lazySingleton<_i361.Dio>(() => coreModule.dio(gh<_i690.DioFactory>()));
    gh.factory<_i1008.NewsRepository>(
      () => _i1008.NewsRepository(gh<_i937.NewsRemoteDataSource>()),
    );
    gh.factory<_i525.GetTopHeadlinesUseCase>(
      () => _i525.GetTopHeadlinesUseCase(gh<_i1008.NewsRepository>()),
    );
    gh.factory<_i817.NewsCubit>(
      () => _i817.NewsCubit(gh<_i525.GetTopHeadlinesUseCase>()),
    );
    return this;
  }
}

class _$CoreModule extends _i690.CoreModule {}
