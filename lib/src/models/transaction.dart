import 'dart:convert';
import 'dart:core';
import 'package:get/utils.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

// const serverUrl = 'https://remo-api.herokuapp.com';
const serverUrl = 'http://localhost:9999';


@JsonSerializable()
class Transaction {
  Transaction({
    required this.transactionType,
    required this.phoneNumber,
    required this.amount,
    required this.commission,
  });

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  final String transactionType;
  final String phoneNumber;
  final double amount;
  final double commission;
}

@JsonSerializable()
class TransactionsList {
  TransactionsList(this.id, this.date, this.transactionType, this.phoneNumber, this.amount, this.commission, this.createdAt, this.updatedAt);

  factory TransactionsList.fromJson(Map<String, dynamic> json) =>
      _$TransactionsListFromJson(json);

  final String id;
  final String date;
  final String transactionType;
  final String phoneNumber;
  final double amount;
  final double commission;
  final DateTime createdAt;
  final DateTime updatedAt;
}

@JsonSerializable()
class TransactionsData {
  TransactionsData(this.date, this.value, );

  factory TransactionsData.fromJson(Map<String, dynamic> json) => _$TransactionsDataFromJson(json);

  final String date;
  final double value;
}

@JsonSerializable()
class TransactionCreatedSuccessResponse {
  TransactionCreatedSuccessResponse(
      this.id,
      this.date,
      this.transactionType,
      this.phoneNumber,
      this.amount,
      this.commission,
      this.createdAt,
      this.updatedAt
  );

  factory TransactionCreatedSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionCreatedSuccessResponseFromJson(json);

  final String id;
  final String date;
  final String transactionType;
  final String phoneNumber;
  final double amount;
  final double commission;
  final DateTime createdAt;
  final DateTime updatedAt;
}

@JsonSerializable()
class FailedErrorResponse {
  FailedErrorResponse({required this.status, required this.data});

  factory FailedErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$FailedErrorResponseFromJson(json);

  String status;
  Data data;
}

@JsonSerializable()
class Data {
  Data({required this.code, required this.message});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  int code;
  String message;
}

Future<String> performTransaction(
    String transactionType,
    String phoneNumber, double amount, double commission) async {

  var message = 'failure';

  if (transactionType == '' || phoneNumber == '' || amount == 0){
    return 'some fields are empty';
  }

  const createTransactionURL = '$serverUrl/records';

  print('=>>>>>>>>>> performing a transaction <<<<<<<<<<<<<=');
  http.Response? response;

  var transaction = Transaction(
      transactionType: transactionType,
      phoneNumber: phoneNumber,
      amount: amount,
      commission: commission
  );

  try {
    response = await http.post(Uri.parse(createTransactionURL), body: json.encode(transaction));
    print(json.decode(response.body));
  } catch (e) {
    message = 'failure';
    e.printError();
  }

  try{
    if (response!.statusCode == 201) {
      message = 'success';
      print("success");
    } else {
      message = 'failure';
      print("failure");
    }

  } catch (e) {
    message = 'failure';
    e.printError();
  }

  return message;
}

Future<List<TransactionsList>> fetchDailyTransactions() async {

  List<TransactionsList> list = [];

  const fetchTransactionURL = '$serverUrl/records/today';

  print('=>>>>>>>>>> performing a transaction <<<<<<<<<<<<<=');
  http.Response? response;

  try {
    response = await http.get(Uri.parse(fetchTransactionURL));
  } catch (e) {
    print("perform");
    print(e.toString());
  }

  try{
    if (response!.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      list = jsonResponse.map((data) => TransactionsList.fromJson(data)).toList();
    }

  } catch (e) {
    print(e.toString());
  }

  return list;
}

Future<TransactionsData> fetchDailyTransactionsCount() async {
  const fetchTransactionURL = '$serverUrl/records/today/count';

  http.Response? response;

  print("getting count data ... ");
  try {
    response = await http.get(Uri.parse(fetchTransactionURL));
  } catch (e) {
    print("total");
    print(e.toString());
  }

  TransactionsData transactionsCount = TransactionsData("", 0);

  try{
    if (response!.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);
      transactionsCount = TransactionsData.fromJson(jsonResponse);
    }

  } catch (e) {
    print("total");
    print(e.toString());
  }

  return transactionsCount;
}

Future<TransactionsData> fetchDailyCommissions() async {
  const fetchTransactionURL = '$serverUrl/commission/daily';

  http.Response? response;

  print("getting count data ... ");
  try {
    response = await http.get(Uri.parse(fetchTransactionURL));
  } catch (e) {
    print("daily");
    print(e.toString());
  }

  TransactionsData transactionsCount = TransactionsData("", 0);

  try{
    if (response!.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);

      transactionsCount = TransactionsData.fromJson(jsonResponse);
    }

  } catch (e) {
    print("daily");
    print(e.toString());
  }

  return transactionsCount;
}

Future<TransactionsData> fetchMonthlyCommissions() async {
  const fetchTransactionURL = '$serverUrl/commission/monthly';

  http.Response? response;

  print("getting count data ... ");
  try {
    response = await http.get(Uri.parse(fetchTransactionURL));
  } catch (e) {
    print("monthly");
    print(e.toString());
  }

  TransactionsData transactionsCount = TransactionsData("", 0);

  try{
    if (response!.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);

      transactionsCount = TransactionsData.fromJson(jsonResponse);
      print(transactionsCount);
    }

  } catch (e) {
    print("monthly");
    print(e.toString());
  }

  return transactionsCount;
}
