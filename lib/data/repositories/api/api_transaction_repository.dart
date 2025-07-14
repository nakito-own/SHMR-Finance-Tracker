import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:shmr_finance/core/auth_provider.dart';
import 'package:shmr_finance/domain/models/transaction/transaction.dart';
import 'package:shmr_finance/domain/models/transaction_request/transaction_request.dart';
import 'package:shmr_finance/domain/models/transaction_response/transaction_response.dart';
import 'package:shmr_finance/domain/repositories/transaction_repository.dart';
import 'package:shmr_finance/domain/repositories/transaction_response_repository.dart';

class ApiTransactionRepository
    implements TransactionResponseRepository, TransactionRepository {
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
  @override
  Future<List<Transaction>> getAll() async {
    throw UnimplementedError();
  }

  @override
  Future<void> add(Transaction tx) async {
    final token = await authProvider.getToken();
    final request = TransactionRequest(
      accountId: tx.accountId,
      categoryId: tx.categoryId,
      amount: tx.amount,
      transactionDate: tx.transactionDate,
      comment: tx.comment,
    );
    await dio.post(
      '/api/v1/transactions',
      data: request.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  @override
  Future<void> update(Transaction tx) async {
    final token = await authProvider.getToken();
    final request = TransactionRequest(
      accountId: tx.accountId,
      categoryId: tx.categoryId,
      amount: tx.amount,
      transactionDate: tx.transactionDate,
      comment: tx.comment,
    );
    await dio.put(
      '/api/v1/transactions/${tx.id}',
      data: request.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  @override
  Future<void> delete(String id) async {
    final token = await authProvider.getToken();
    await dio.delete(
      '/api/v1/transactions/$id',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
