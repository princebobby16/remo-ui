import 'package:flutter/material.dart';
import 'package:momo_recorder_ui_app/src/components/bottom_navbar.dart';
import '../components/remo_app_bar.dart';
import '../models/transaction.dart';

class RemoViewTransactions extends StatefulWidget {
  const RemoViewTransactions({Key? key}) : super(key: key);

  @override
  State<RemoViewTransactions> createState() => _RemoViewTransactionsState();
}

class _RemoViewTransactionsState extends State<RemoViewTransactions> {
  late Future<List<TransactionsList>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchDailyTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RemoAppBar(title: 'Transactions', implyLeading: true, backButton: BackButton(
        onPressed: () => {
          Navigator.of(context).pushNamed('/home')
        },
      )),
      extendBody: true,
      body: Center(
        child: ConstrainedBox(
            constraints: const BoxConstraints(
                minHeight: 5.0, maxHeight: 800.0, minWidth: 100, maxWidth: 470),
            child: FlutterList(data: futureData)),
      ),
      bottomNavigationBar: const RemoBottomNavBar(),
    );
  }
}

class FlutterList extends StatelessWidget {
  const FlutterList({Key? key, required this.data}) : super(key: key);

  final Future data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            List<TransactionsList> data =
                snapshot.data as List<TransactionsList>;
            return ListView.separated(
              itemBuilder: (context, position) {
                return Card(
                  // shadowColor: Colors.lightBlueAccent,
                  elevation: 3.0,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            data[position].transactionType,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            data[position].date,
                            style: const TextStyle(color: Colors.black26),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            data[position].amount.toString(),
                            style: const TextStyle(color: Colors.greenAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, position) {
                return const SizedBox(height: 2);
              },
              itemCount: data.length,
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.lightBlueAccent,
          ),
        );
      },
    );
  }
}
