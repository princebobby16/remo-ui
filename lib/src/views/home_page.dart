import 'package:flutter/material.dart';
import 'package:momo_recorder_ui_app/src/components/card.dart';
import 'package:momo_recorder_ui_app/src/models/transaction.dart';

class RemoHomePage extends StatefulWidget {
  const RemoHomePage({Key? key}) : super(key: key);

  @override
  State<RemoHomePage> createState() => _RemoHomePageState();
}

class _RemoHomePageState extends State<RemoHomePage> {
  late Future<TransactionsData> dailyCommissionData;
  late Future<TransactionsData> monthlyCommissionData;
  late Future<TransactionsData> transactionsCountData;

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
          RemoCard(
              title: "Total Transactions", responseData: transactionsCountData, isGHS: false,),
          RemoCard(
              title: "Daily Commissions", responseData: dailyCommissionData, isGHS: true),
          RemoCard(
              title: "Monthly Commissions",
              responseData: monthlyCommissionData, isGHS: true),
          SizedBox(height: 0.2 * MediaQuery.of(context).size.height),
        ],
      ),
    );
  }
}
