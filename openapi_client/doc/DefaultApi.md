# openapi_client.api.DefaultApi

## Load the API package
```dart
import 'package:openapi_client/api.dart';
```

All URIs are relative to *https://shmr-finance.ru/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accountsGet**](DefaultApi.md#accountsget) | **GET** /accounts | Получить все счета пользователя
[**accountsIdGet**](DefaultApi.md#accountsidget) | **GET** /accounts/{id} | Получить счет по ID
[**accountsIdHistoryGet**](DefaultApi.md#accountsidhistoryget) | **GET** /accounts/{id}/history | Получить историю изменений счета
[**accountsIdPut**](DefaultApi.md#accountsidput) | **PUT** /accounts/{id} | Обновить счет
[**accountsPost**](DefaultApi.md#accountspost) | **POST** /accounts | Создать новый счет
[**categoriesGet**](DefaultApi.md#categoriesget) | **GET** /categories | Получить все категории
[**categoriesTypeIsIncomeGet**](DefaultApi.md#categoriestypeisincomeget) | **GET** /categories/type/{isIncome} | Получить категории по типу
[**transactionsAccountAccountIdPeriodGet**](DefaultApi.md#transactionsaccountaccountidperiodget) | **GET** /transactions/account/{accountId}/period | Получить транзакции по счету за период
[**transactionsIdDelete**](DefaultApi.md#transactionsiddelete) | **DELETE** /transactions/{id} | Удалить транзакцию
[**transactionsIdGet**](DefaultApi.md#transactionsidget) | **GET** /transactions/{id} | Получить транзакцию по ID
[**transactionsIdPut**](DefaultApi.md#transactionsidput) | **PUT** /transactions/{id} | Обновить транзакцию
[**transactionsPost**](DefaultApi.md#transactionspost) | **POST** /transactions | Создать новую транзакцию


# **accountsGet**
> List<Account> accountsGet()

Получить все счета пользователя

Возвращает список всех счетов текущего пользователя

### Example
```dart
import 'package:openapi_client/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();

try {
    final result = api_instance.accountsGet();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->accountsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Account>**](Account.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountsIdGet**
> AccountResponse accountsIdGet(id)

Получить счет по ID

Возвращает информацию о конкретном счете, включая статистику

### Example
```dart
import 'package:openapi_client/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final id = 56; // int | ID счета

try {
    final result = api_instance.accountsIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->accountsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID счета | 

### Return type

[**AccountResponse**](AccountResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountsIdHistoryGet**
> AccountHistoryResponse accountsIdHistoryGet(id)

Получить историю изменений счета

Возвращает историю изменений баланса и других параметров счета, произведенных вне транзакций (при создании или изменении счета)

### Example
```dart
import 'package:openapi_client/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final id = 56; // int | ID счета

try {
    final result = api_instance.accountsIdHistoryGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->accountsIdHistoryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID счета | 

### Return type

[**AccountHistoryResponse**](AccountHistoryResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountsIdPut**
> Account accountsIdPut(id, accountUpdateRequest)

Обновить счет

Обновляет данные существующего счета

### Example
```dart
import 'package:openapi_client/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final id = 56; // int | ID счета
final accountUpdateRequest = AccountUpdateRequest(); // AccountUpdateRequest | 

try {
    final result = api_instance.accountsIdPut(id, accountUpdateRequest);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->accountsIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID счета | 
 **accountUpdateRequest** | [**AccountUpdateRequest**](AccountUpdateRequest.md)|  | 

### Return type

[**Account**](Account.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountsPost**
> Account accountsPost(accountCreateRequest)

Создать новый счет

Создает новый счет для текущего пользователя

### Example
```dart
import 'package:openapi_client/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final accountCreateRequest = AccountCreateRequest(); // AccountCreateRequest | 

try {
    final result = api_instance.accountsPost(accountCreateRequest);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->accountsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountCreateRequest** | [**AccountCreateRequest**](AccountCreateRequest.md)|  | 

### Return type

[**Account**](Account.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **categoriesGet**
> List<Category> categoriesGet()

Получить все категории

Возвращает список всех категорий (доходов и расходов)

### Example
```dart
import 'package:openapi_client/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();

try {
    final result = api_instance.categoriesGet();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->categoriesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Category>**](Category.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **categoriesTypeIsIncomeGet**
> List<Category> categoriesTypeIsIncomeGet(isIncome)

Получить категории по типу

Возвращает список категорий доходов или расходов

### Example
```dart
import 'package:openapi_client/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final isIncome = true; // bool | Тип категорий: true - доходы, false - расходы

try {
    final result = api_instance.categoriesTypeIsIncomeGet(isIncome);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->categoriesTypeIsIncomeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **isIncome** | **bool**| Тип категорий: true - доходы, false - расходы | 

### Return type

[**List<Category>**](Category.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **transactionsAccountAccountIdPeriodGet**
> List<TransactionResponse> transactionsAccountAccountIdPeriodGet(accountId, startDate, endDate)

Получить транзакции по счету за период

Возвращает список транзакций для указанного счета за указанный период

### Example
```dart
import 'package:openapi_client/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final accountId = 56; // int | ID счета
final startDate = 2013-10-20; // DateTime | Начальная дата периода (YYYY-MM-DD). Если не указана, используется начало текущего месяца.
final endDate = 2013-10-20; // DateTime | Конечная дата периода (YYYY-MM-DD). Если не указана, используется конец текущего месяца.

try {
    final result = api_instance.transactionsAccountAccountIdPeriodGet(accountId, startDate, endDate);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->transactionsAccountAccountIdPeriodGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountId** | **int**| ID счета | 
 **startDate** | **DateTime**| Начальная дата периода (YYYY-MM-DD). Если не указана, используется начало текущего месяца. | [optional] 
 **endDate** | **DateTime**| Конечная дата периода (YYYY-MM-DD). Если не указана, используется конец текущего месяца. | [optional] 

### Return type

[**List<TransactionResponse>**](TransactionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **transactionsIdDelete**
> transactionsIdDelete(id)

Удалить транзакцию

Удаляет транзакцию с возможностью возврата средств на счет

### Example
```dart
import 'package:openapi_client/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final id = 56; // int | ID транзакции

try {
    api_instance.transactionsIdDelete(id);
} catch (e) {
    print('Exception when calling DefaultApi->transactionsIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID транзакции | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **transactionsIdGet**
> TransactionResponse transactionsIdGet(id)

Получить транзакцию по ID

Возвращает детальную информацию о транзакции

### Example
```dart
import 'package:openapi_client/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final id = 56; // int | ID транзакции

try {
    final result = api_instance.transactionsIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->transactionsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID транзакции | 

### Return type

[**TransactionResponse**](TransactionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **transactionsIdPut**
> TransactionResponse transactionsIdPut(id, transactionRequest)

Обновить транзакцию

Обновляет существующую транзакцию

### Example
```dart
import 'package:openapi_client/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final id = 56; // int | ID транзакции
final transactionRequest = TransactionRequest(); // TransactionRequest | 

try {
    final result = api_instance.transactionsIdPut(id, transactionRequest);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->transactionsIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID транзакции | 
 **transactionRequest** | [**TransactionRequest**](TransactionRequest.md)|  | 

### Return type

[**TransactionResponse**](TransactionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **transactionsPost**
> Transaction transactionsPost(transactionRequest)

Создать новую транзакцию

Создает новую транзакцию (доход или расход)

### Example
```dart
import 'package:openapi_client/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final transactionRequest = TransactionRequest(); // TransactionRequest | 

try {
    final result = api_instance.transactionsPost(transactionRequest);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->transactionsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **transactionRequest** | [**TransactionRequest**](TransactionRequest.md)|  | 

### Return type

[**Transaction**](Transaction.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

