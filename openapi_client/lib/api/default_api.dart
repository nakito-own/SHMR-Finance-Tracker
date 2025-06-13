//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DefaultApi {
  DefaultApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Получить все счета пользователя
  ///
  /// Возвращает список всех счетов текущего пользователя
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> accountsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/accounts';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Получить все счета пользователя
  ///
  /// Возвращает список всех счетов текущего пользователя
  Future<List<Account>?> accountsGet() async {
    final response = await accountsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Account>') as List)
        .cast<Account>()
        .toList(growable: false);

    }
    return null;
  }

  /// Получить счет по ID
  ///
  /// Возвращает информацию о конкретном счете, включая статистику
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID счета
  Future<Response> accountsIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/accounts/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Получить счет по ID
  ///
  /// Возвращает информацию о конкретном счете, включая статистику
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID счета
  Future<AccountResponse?> accountsIdGet(int id,) async {
    final response = await accountsIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AccountResponse',) as AccountResponse;
    
    }
    return null;
  }

  /// Получить историю изменений счета
  ///
  /// Возвращает историю изменений баланса и других параметров счета, произведенных вне транзакций (при создании или изменении счета)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID счета
  Future<Response> accountsIdHistoryGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/accounts/{id}/history'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Получить историю изменений счета
  ///
  /// Возвращает историю изменений баланса и других параметров счета, произведенных вне транзакций (при создании или изменении счета)
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID счета
  Future<AccountHistoryResponse?> accountsIdHistoryGet(int id,) async {
    final response = await accountsIdHistoryGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AccountHistoryResponse',) as AccountHistoryResponse;
    
    }
    return null;
  }

  /// Обновить счет
  ///
  /// Обновляет данные существующего счета
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID счета
  ///
  /// * [AccountUpdateRequest] accountUpdateRequest (required):
  Future<Response> accountsIdPutWithHttpInfo(int id, AccountUpdateRequest accountUpdateRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/accounts/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = accountUpdateRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Обновить счет
  ///
  /// Обновляет данные существующего счета
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID счета
  ///
  /// * [AccountUpdateRequest] accountUpdateRequest (required):
  Future<Account?> accountsIdPut(int id, AccountUpdateRequest accountUpdateRequest,) async {
    final response = await accountsIdPutWithHttpInfo(id, accountUpdateRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Account',) as Account;
    
    }
    return null;
  }

  /// Создать новый счет
  ///
  /// Создает новый счет для текущего пользователя
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AccountCreateRequest] accountCreateRequest (required):
  Future<Response> accountsPostWithHttpInfo(AccountCreateRequest accountCreateRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/accounts';

    // ignore: prefer_final_locals
    Object? postBody = accountCreateRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Создать новый счет
  ///
  /// Создает новый счет для текущего пользователя
  ///
  /// Parameters:
  ///
  /// * [AccountCreateRequest] accountCreateRequest (required):
  Future<Account?> accountsPost(AccountCreateRequest accountCreateRequest,) async {
    final response = await accountsPostWithHttpInfo(accountCreateRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Account',) as Account;
    
    }
    return null;
  }

  /// Получить все категории
  ///
  /// Возвращает список всех категорий (доходов и расходов)
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> categoriesGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/categories';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Получить все категории
  ///
  /// Возвращает список всех категорий (доходов и расходов)
  Future<List<Category>?> categoriesGet() async {
    final response = await categoriesGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Category>') as List)
        .cast<Category>()
        .toList(growable: false);

    }
    return null;
  }

  /// Получить категории по типу
  ///
  /// Возвращает список категорий доходов или расходов
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [bool] isIncome (required):
  ///   Тип категорий: true - доходы, false - расходы
  Future<Response> categoriesTypeIsIncomeGetWithHttpInfo(bool isIncome,) async {
    // ignore: prefer_const_declarations
    final path = r'/categories/type/{isIncome}'
      .replaceAll('{isIncome}', isIncome.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Получить категории по типу
  ///
  /// Возвращает список категорий доходов или расходов
  ///
  /// Parameters:
  ///
  /// * [bool] isIncome (required):
  ///   Тип категорий: true - доходы, false - расходы
  Future<List<Category>?> categoriesTypeIsIncomeGet(bool isIncome,) async {
    final response = await categoriesTypeIsIncomeGetWithHttpInfo(isIncome,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Category>') as List)
        .cast<Category>()
        .toList(growable: false);

    }
    return null;
  }

  /// Получить транзакции по счету за период
  ///
  /// Возвращает список транзакций для указанного счета за указанный период
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] accountId (required):
  ///   ID счета
  ///
  /// * [DateTime] startDate:
  ///   Начальная дата периода (YYYY-MM-DD). Если не указана, используется начало текущего месяца.
  ///
  /// * [DateTime] endDate:
  ///   Конечная дата периода (YYYY-MM-DD). Если не указана, используется конец текущего месяца.
  Future<Response> transactionsAccountAccountIdPeriodGetWithHttpInfo(int accountId, { DateTime? startDate, DateTime? endDate, }) async {
    // ignore: prefer_const_declarations
    final path = r'/transactions/account/{accountId}/period'
      .replaceAll('{accountId}', accountId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (startDate != null) {
      queryParams.addAll(_queryParams('', 'startDate', startDate));
    }
    if (endDate != null) {
      queryParams.addAll(_queryParams('', 'endDate', endDate));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Получить транзакции по счету за период
  ///
  /// Возвращает список транзакций для указанного счета за указанный период
  ///
  /// Parameters:
  ///
  /// * [int] accountId (required):
  ///   ID счета
  ///
  /// * [DateTime] startDate:
  ///   Начальная дата периода (YYYY-MM-DD). Если не указана, используется начало текущего месяца.
  ///
  /// * [DateTime] endDate:
  ///   Конечная дата периода (YYYY-MM-DD). Если не указана, используется конец текущего месяца.
  Future<List<TransactionResponse>?> transactionsAccountAccountIdPeriodGet(int accountId, { DateTime? startDate, DateTime? endDate, }) async {
    final response = await transactionsAccountAccountIdPeriodGetWithHttpInfo(accountId,  startDate: startDate, endDate: endDate, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<TransactionResponse>') as List)
        .cast<TransactionResponse>()
        .toList(growable: false);

    }
    return null;
  }

  /// Удалить транзакцию
  ///
  /// Удаляет транзакцию с возможностью возврата средств на счет
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID транзакции
  Future<Response> transactionsIdDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/transactions/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Удалить транзакцию
  ///
  /// Удаляет транзакцию с возможностью возврата средств на счет
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID транзакции
  Future<void> transactionsIdDelete(int id,) async {
    final response = await transactionsIdDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Получить транзакцию по ID
  ///
  /// Возвращает детальную информацию о транзакции
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID транзакции
  Future<Response> transactionsIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/transactions/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Получить транзакцию по ID
  ///
  /// Возвращает детальную информацию о транзакции
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID транзакции
  Future<TransactionResponse?> transactionsIdGet(int id,) async {
    final response = await transactionsIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TransactionResponse',) as TransactionResponse;
    
    }
    return null;
  }

  /// Обновить транзакцию
  ///
  /// Обновляет существующую транзакцию
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID транзакции
  ///
  /// * [TransactionRequest] transactionRequest (required):
  Future<Response> transactionsIdPutWithHttpInfo(int id, TransactionRequest transactionRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/transactions/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = transactionRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Обновить транзакцию
  ///
  /// Обновляет существующую транзакцию
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID транзакции
  ///
  /// * [TransactionRequest] transactionRequest (required):
  Future<TransactionResponse?> transactionsIdPut(int id, TransactionRequest transactionRequest,) async {
    final response = await transactionsIdPutWithHttpInfo(id, transactionRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TransactionResponse',) as TransactionResponse;
    
    }
    return null;
  }

  /// Создать новую транзакцию
  ///
  /// Создает новую транзакцию (доход или расход)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [TransactionRequest] transactionRequest (required):
  Future<Response> transactionsPostWithHttpInfo(TransactionRequest transactionRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/transactions';

    // ignore: prefer_final_locals
    Object? postBody = transactionRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Создать новую транзакцию
  ///
  /// Создает новую транзакцию (доход или расход)
  ///
  /// Parameters:
  ///
  /// * [TransactionRequest] transactionRequest (required):
  Future<Transaction?> transactionsPost(TransactionRequest transactionRequest,) async {
    final response = await transactionsPostWithHttpInfo(transactionRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Transaction',) as Transaction;
    
    }
    return null;
  }
}
