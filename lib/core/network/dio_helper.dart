import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          await Future.delayed(
            const Duration(milliseconds: 800),
          ); // Simulate network

          // Check if we are asking for gold or silver and return the right data
          if (options.path.contains('gold')) {
            return handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: {
                  "rates": {
                    "per_ounce": 2341.50,
                    "per_gram": 75.28,
                    "per_kilogram": 75281.00,
                  },
                  "changes": {"percentage": "+0.85%"},
                },
              ),
            );
          } else {
            return handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: {
                  "rates": {
                    "per_ounce": 29.45,
                    "per_gram": 0.95,
                    "per_kilogram": 946.83,
                  },
                  "changes": {"percentage": "+4.39%"},
                },
              ),
            );
          }
        },
      ),
    );
  }

  static Future<Response> getMetalData(String metal) async {
    return await dio.get('latest/$metal');
  }
}
