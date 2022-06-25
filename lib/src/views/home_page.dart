import 'package:flutter/material.dart';
import 'package:momo_recorder_ui_app/src/components/card.dart';
import 'package:momo_recorder_ui_app/src/models/transaction.dart';

class RemoHomePage extends StatefulWidget {
  const RemoHomePage({Key? key}) : super(key: key);

  @override
  State<RemoHomePage> createState() => _RemoHomePageState();
}

class _RemoHomePageState extends State<RemoHomePage> {
  late Future <TransactionsData> dailyCommissionData;
  late Future <TransactionsData> monthlyCommissionData;
  late Future <TransactionsData> transactionsCountData;

  @override
  void initState() {
    super.initState();
    dailyCommissionData = fetchDailyCommissions();
    monthlyCommissionData = fetchMonthlyCommissions();
    transactionsCountData = fetchDailyTransactionsCount();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          FutureBuilder(
            future: transactionsCountData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if(snapshot.hasData) {
                  TransactionsData data = snapshot.data as TransactionsData;
                  print(data.value);
                  return RemoCard(title: "Total Transactions", subtitle: data.date, value: data.value.toString());
                }
              }
              return Column(
                children: const [
                  SizedBox(height: 100),
                  CircularProgressIndicator(
                    color: Colors.lightBlueAccent,
                  ),
                ],
              );
            }
          ),
          FutureBuilder(
              future: dailyCommissionData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.hasData) {
                    TransactionsData data = snapshot.data as TransactionsData;
                    return RemoCard(title: "Daily Commission", subtitle: data.date, value: data.value.toString());
                  }
                }
                return Column(
                  children: const [
                    SizedBox(height: 100),
                    CircularProgressIndicator(
                      color: Colors.lightBlueAccent,
                    ),
                  ],
                );
              }
          ),
          FutureBuilder(
              future: monthlyCommissionData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.hasData) {
                    TransactionsData data = snapshot.data as TransactionsData;
                    return RemoCard(title: "Monthly Commission", subtitle: data.date, value: data.value.toString());
                  }
                }
                return Column(
                  children: const [
                    SizedBox(height: 100),
                    CircularProgressIndicator(
                      color: Colors.lightBlueAccent,
                    ),
                  ],
                );
              }
          ),
        ],
      ),
    );
  }
}
