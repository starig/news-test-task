import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_test_task/core/constants.dart';
import 'package:news_test_task/core/interceptors/x_api_key_interceptor.dart';

@module
abstract class CoreModule {
  @lazySingleton
  Dio dio(DioFactory dioFactory) {
    return dioFactory.build(
      baseUrl: AppConstants.baseUrl,
    );
  }
}

@injectable
class DioFactory {
  Dio build({
    required String baseUrl,
  }) {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(XApiKeyInterceptor());
    return dio;
  }
}
