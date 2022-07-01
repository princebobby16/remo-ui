import 'dart:async';

import 'package:flutter/material.dart';
import 'package:momo_recorder_ui_app/src/components/input.dart';
import 'package:momo_recorder_ui_app/src/services/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _btnController = RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
    _btnController.stateStream.listen((value) {
      print(value);
    });
  }

  Widget _buildEmail() {
    return RemoInput(
        placeholder: 'email',
        textEditingController: _emailController,
        icon: Icons.email);
  }

  Widget _buildPassword() {
    return RemoInput(
        placeholder: 'Password',
        textEditingController: _passwordController,
        icon: Icons.lock,
        hideText: true);
  }

  Widget _buildRoundedButton(BuildContext context) {
    return RoundedLoadingButton(
      controller: _btnController,
      onPressed: () {
        Future<String?> resp = context.read<AuthenticationService>().signIn(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());

        String? response = '';

        resp.then((value) => {
              setState(() {
                response = value;
                print(response);
                if (response == null) {
                  _btnController.reset();
                } else if (response == "Signed In"){
                  // do nothing
                } else {
                  String errorMessage = response!;
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Error"),
                        content: Text(errorMessage),
                      )
                  );
                  _btnController.reset();
                }
              })
            });
      },
      color: Colors.lime,
      child: const Text('Login',
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5)
                ],
                    stops: [
                  0.1,
                  0.4,
                  0.7,
                  0.9
                ])),
            curve: Curves.easeInSine,
            duration: Duration(seconds: 1),
          ),
          AnimatedContainer(
            height: double.infinity,
            duration: const Duration(seconds: 1),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  const Text(
                    'Remo',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontFamily: 'Open Sans',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEmail(),
                      const SizedBox(height: 30),
                      _buildPassword(),
                      const SizedBox(height: 60),
                      _buildRoundedButton(context),
                      const SizedBox(height: 100),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
