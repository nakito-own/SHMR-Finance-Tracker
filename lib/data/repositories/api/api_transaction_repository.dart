import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:shmr_finance/core/auth_provider.dart';
import 'package:shmr_finance/domain/models/transaction_response/transaction_response.dart';
import 'package:shmr_finance/domain/repositories/transaction_response_repository.dart';

class ApiTransactionRepository implements TransactionResponseRepository {
  final Dio dio;
  final AuthProvider authProvider;

  ApiTransactionRepository(this.dio, this.authProvider);

  @override
  Future<List<TransactionResponse>> getByPeriod({
    required int accountId,
    required DateTime start,
    required DateTime end,
  }) async {
    final token = await authProvider.getToken();
    final formatter = DateFormat('yyyy-MM-dd');
    final startStr = formatter.format(start);
    final endStr = formatter.format(end);

    try {
      final response = await dio.get(
        '/api/v1/transactions/account/$accountId/period',
        queryParameters: {
          'startDate': startStr,
          'endDate': endStr,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final rawData = response.data;

      if (rawData is! List) {
        throw Exception('Неверный формат данных: ожидался List, получен ${rawData.runtimeType}');
      }

      return rawData.map((json) => TransactionResponse.fromJson(json)).toList();
    } catch (e, stack) {
      print('Ошибка в getByPeriod: $e');
      print(stack);
      rethrow;
    }
  }
}
