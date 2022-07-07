import 'package:flutter/material.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({Key? key, required this.date, required this.time, required this.amount, required this.commission, required this.phoneNumber, required this.transactionType}) : super(key: key);

  final String date;
  final String time;
  final String amount;
  final String commission;
  final String phoneNumber;
  final String transactionType;

  Container _buildHandle() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      height: 10,
      width: 40,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height * 0.55,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50)
          )
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHandle(),
              const Text(
                "Transaction",
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DataField(
                      icon: Icons.date_range,
                      iconColour: Colors.brown,
                      title: "Transaction Date",
                      subTitle: time,
                      value: date
                  ),
                  DataField(
                      icon: Icons.attach_money_sharp,
                      iconColour: Colors.orangeAccent,
                      title: "Amount",
                      subTitle: "GHS",
                      value: amount
                  ),
                  DataField(
                      icon: Icons.attach_money_rounded,
                      iconColour: Colors.greenAccent,
                      title: "Commission",
                      subTitle: "GHS",
                      value: commission
                  ),
                  DataField(
                      icon: Icons.phone,
                      iconColour: Colors.greenAccent,
                      title: "Phone Number",
                      subTitle: "+233",
                      value: phoneNumber
                  ),
                  DataField(
                      icon: Icons.tablet_android,
                      iconColour: Colors.lightBlueAccent,
                      title: "Transaction Type",
                      subTitle: "MTN",
                      value: transactionType
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}

class DataField extends StatelessWidget {
  const DataField({Key? key, required this.icon, required this.iconColour, required this.title, required this.subTitle, required this.value}) : super(key: key);

  final IconData icon;
  final Color iconColour;
  final String title;
  final String subTitle;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Color(0x74D6EEE7),
                      borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                  width: 50,
                  margin: const EdgeInsets.only(right: 20),
                  height: 50,
                  child: Icon(
                    icon, color: iconColour,
                  )
              ),
              SizedBox(
                height: 35,
                child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          subTitle,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Text(value,style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}

