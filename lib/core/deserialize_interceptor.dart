import 'package:dio/dio.dart';
import 'package:worker_manager/worker_manager.dart';

/// Function signature for custom JSON deserialization.
typedef Deserializer = dynamic Function(dynamic json);

/// Interceptor that offloads JSON deserialization to a worker isolate.
class DeserializeInterceptor extends Interceptor {

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final deserializer = response.requestOptions.extra['deserialize'];
    if (deserializer is Deserializer) {
      try {
        final result = await workerManager
            .execute(() => deserializer(response.data));
        response.data = await result;
      } catch (_) {
        // If anything fails, keep original data
      }
    }
    handler.next(response);
  }
}