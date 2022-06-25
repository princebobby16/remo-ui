import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momo_recorder_ui_app/src/components/bottom_navbar.dart';
import 'package:momo_recorder_ui_app/src/models/transaction.dart';
class RemoCommission extends StatefulWidget {
  const RemoCommission({Key? key}) : super(key: key);

  @override
  State<RemoCommission> createState() => _RemoCommissionState();
}

class _RemoCommissionState extends State<RemoCommission> {

  final phoneNumberController = TextEditingController();
  final amountController = TextEditingController();
  final commissionsController = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "DEPOSIT", child: Text("DEPOSIT")),
      const DropdownMenuItem(value: "TRANSFER", child: Text("TRANSFER")),
      const DropdownMenuItem(value: "WITHDRAWAL", child: Text("WITHDRAWAL")),
      const DropdownMenuItem(value: "AIRTIME", child: Text("AIRTIME")),
    ];
    return menuItems;
  }

  String selectedValue = "TRANSFER";


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    phoneNumberController.dispose();
    amountController.dispose();
    commissionsController.dispose();
    super.dispose();
  }


  Widget _buildTransactionInput(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        dropdownColor: Colors.white,
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: dropdownItems
    );
  }

  Widget _buildNumberInput(BuildContext context) {
    return TextField(
      enabled: true,
      controller: phoneNumberController,
      keyboardType: TextInputType.phone,
      cursorColor: Colors.black26,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(Icons.numbers, color: Colors.black),
          hintText: "Enter Phone Number",
          hintStyle: TextStyle(color: Colors.black26)
      ),
    );
  }
  Widget _buildAmountInput(BuildContext context) {
    return TextField(
      enabled: true,
      controller: amountController,
      keyboardType: TextInputType.phone,
      cursorColor: Colors.black26,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(Icons.payment, color: Colors.black),
          hintText: "Enter Amount",
          hintStyle: TextStyle(color: Colors.black26)
      ),
    );
  }
  Widget _buildCommissionInput(BuildContext context) {
    return TextField(
      enabled: true,
      controller: commissionsController,
      keyboardType: TextInputType.phone,
      cursorColor: Colors.black26,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(Icons.attach_money, color: Colors.black),
          hintText: "Enter Commission",
          hintStyle: TextStyle(color: Colors.black26)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Transact", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlueAccent,
        leading: const BackButton(),
      ),
      extendBody: true,
      body: Stack(
          children: [
            AnimatedContainer(
              height: double.infinity,
              duration: const Duration(seconds: 1),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Remo',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontFamily: 'Open Sans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTransactionInput(context),
                        const SizedBox(height: 30),
                        _buildNumberInput(context),
                        const SizedBox(height: 30),
                        _buildAmountInput(context),
                        const SizedBox(height: 30),
                        _buildCommissionInput(context),
                        const SizedBox(height: 30),
                        _buildNextButton(context),
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
      bottomNavigationBar: const RemoBottomNavBar(),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
          padding:
          MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 17.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
              ))),
      onPressed: () {
        // TODO: SEND DATA TO SERVER
        print(phoneNumberController.text);
        print(amountController.text);
        print(commissionsController.text);

        if (phoneNumberController.text == ''
        || amountController.text == '' || commissionsController.text == '') {
          showDialog(context: context, builder: (context) {
            return const AlertDialog(content: Text("please enter all fields"));
          });
          return;
        }

        Future<String> message = performTransaction(
            selectedValue,
            phoneNumberController.text,
            double.parse(amountController.text),
            double.parse(commissionsController.text)
        );
        print(message);

        showDialog(
          context: context,
          builder: (context) {
            return FutureBuilder(
              future: message,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.hasData) {
                    String data = snapshot.data as String;
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content: Text(data),
                    );;
                  }
                }
                return const CircularProgressIndicator();
              }
            );
          },
        );
      },
      child: const Center(
        child: Text('SUBMIT',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                letterSpacing: 1.5)),
      ),
    );
  }
}
