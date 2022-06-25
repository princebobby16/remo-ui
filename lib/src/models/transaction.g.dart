// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      transactionType: json['transactionType'] as String,
      phoneNumber: json['phoneNumber'] as String,
      amount: (json['amount'] as num).toDouble(),
      commission: (json['commission'] as num).toDouble(),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'transactionType': instance.transactionType,
      'phoneNumber': instance.phoneNumber,
      'amount': instance.amount,
      'commission': instance.commission,
    };

TransactionsList _$TransactionsListFromJson(Map<String, dynamic> json) =>
    TransactionsList(
      json['id'] as String,
      json['date'] as String,
      json['transactionType'] as String,
      json['phoneNumber'] as String,
      (json['amount'] as num).toDouble(),
      (json['commission'] as num).toDouble(),
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TransactionsListToJson(TransactionsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'transactionType': instance.transactionType,
      'phoneNumber': instance.phoneNumber,
      'amount': instance.amount,
      'commission': instance.commission,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

TransactionsData _$TransactionsDataFromJson(Map<String, dynamic> json) =>
    TransactionsData(
      json['date'] as String,
      (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$TransactionsDataToJson(TransactionsData instance) =>
    <String, dynamic>{
      'date': instance.date,
      'value': instance.value,
    };

TransactionCreatedSuccessResponse _$TransactionCreatedSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionCreatedSuccessResponse(
      json['id'] as String,
      json['date'] as String,
      json['transactionType'] as String,
      json['phoneNumber'] as String,
      (json['amount'] as num).toDouble(),
      (json['commission'] as num).toDouble(),
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TransactionCreatedSuccessResponseToJson(
        TransactionCreatedSuccessResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'transactionType': instance.transactionType,
      'phoneNumber': instance.phoneNumber,
      'amount': instance.amount,
      'commission': instance.commission,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

FailedErrorResponse _$FailedErrorResponseFromJson(Map<String, dynamic> json) =>
    FailedErrorResponse(
      status: json['status'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FailedErrorResponseToJson(
        FailedErrorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      code: json['code'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
