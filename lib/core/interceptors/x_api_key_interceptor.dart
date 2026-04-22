import 'package:dio/dio.dart';
import 'package:news_test_task/core/constants.dart';

class XApiKeyInterceptor extends Interceptor {
  Future<Map<String, String>>? _headersFuture;

  Future<Map<String, String>> _buildHeaders() async {
    final xApiKey = AppConstants.xApiKey;

    return <String, String>{
      'X-Api-Key': xApiKey,
    };
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    _headersFuture ??= _buildHeaders();

    final Map<String, String> headers = await _headersFuture!;
    options.headers.addAll(headers);

    handler.next(options);
  }
}
