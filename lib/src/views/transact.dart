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
  final _phoneNumberController = TextEditingController();
  final _amountController = TextEditingController();
  final _commissionsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get dropdownItems {
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
    _phoneNumberController.dispose();
    _amountController.dispose();
    _commissionsController.dispose();
    super.dispose();
  }

  String? _errorPhoneNumberText(String? value) {
    // at any time, we can get the text from _controller.value.text
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (value == null || value.isEmpty) {
      return 'can\'t be empty';
    }
    if (value.length < 10) {
      return 'not a valid phone number';
    }
    // return null if the text is valid
    return null;
  }

  String? _errorAmountText(String? value) {
    // at any time, we can get the text from _controller.value.text
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (value == null || value.isEmpty) {
      return 'can\'t be empty';
    }
    // return null if the text is valid
    return null;
  }

  String? _errorCommissionText(String? value) {
    // at any time, we can get the text from _controller.value.text
    // Note: you can do your own custom validation here
    if (selectedValue == 'DEPOSIT' || selectedValue == 'WITHDRAWAL') {
      _commissionsController.text = '0.0';
      return null;
    }
    // Move this logic this outside the widget for more testable code
    if (value == null || value.isEmpty) {
      return 'can\'t be empty';
    }
    // return null if the text is valid
    return null;
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
        items: dropdownItems);
  }

  Widget _buildNumberInput(BuildContext context) {
    return TextFormField(
        enabled: true,
        controller: _phoneNumberController,
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
            hintStyle: TextStyle(color: Colors.black26)),
        validator: _errorPhoneNumberText);
  }

  Widget _buildAmountInput(BuildContext context) {
    return TextFormField(
      enabled: true,
      controller: _amountController,
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
          hintStyle: TextStyle(color: Colors.black26)),
      validator: _errorAmountText,
    );
  }

  Widget _buildCommissionInput(BuildContext context) {
    return TextFormField(
      enabled: true,
      controller: _commissionsController,
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
          hintStyle: TextStyle(color: Colors.black26)),
      validator: _errorCommissionText,
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
      body: Stack(children: [
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding:
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
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
              Form(
                key: _formKey,
                child: Column(
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
                ),
              )
            ],
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
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 17.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
          ))),
      onPressed: () {
        // TODO: SEND DATA TO SERVER
        print(_phoneNumberController.text);
        print(_amountController.text);
        print(_commissionsController.text);

        if (_formKey.currentState!.validate()) {
          Future<String> message = performTransaction(
              selectedValue,
              _phoneNumberController.text,
              double.parse(_amountController.text),
              double.parse(_commissionsController.text));
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
                        );
                      }
                    }
                    return const CircularProgressIndicator();
                  });
            },
          );
          setState(() {
            _phoneNumberController.clear();
            _amountController.clear();
            _commissionsController.clear();
          });
        }
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
