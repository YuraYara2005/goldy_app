import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    // Mock Interceptor: Simulates server response automatically without an API key
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.path.contains(AppConstants.silverEndpoint)) {
            // Simulate network latency
            await Future.delayed(const Duration(milliseconds: 800));

            // Return fake successful response data matching a real commodities API structure
            final mockResponse = Response(
              requestOptions: options,
              statusCode: 200,
              data: {
                "status": "success",
                "base": "USD",
                "metal": "silver",
                "rates": {
                  "per_ounce": 29.45,
                  "per_gram": 0.95,
                  "per_kilogram": 946.83,
                },
                "changes": {"day": 1.24, "percentage": "+4.39%"},
              },
            );
            return handler.resolve(mockResponse);
          }
          return handler.next(options);
        },
      ),
    );
  }

  static Future<Response> getSilverData() async {
    return await dio.get(AppConstants.silverEndpoint);
  }
}
