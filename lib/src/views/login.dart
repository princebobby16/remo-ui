import 'package:flutter/material.dart';
import 'package:momo_recorder_ui_app/src/components/input.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  Widget _buildEmail() {
    return const RemoInput(placeholder: 'Merchant Id', icon: Icons.person);
  }

  Widget _buildPassword() {
    return const RemoInput(placeholder: 'Password', icon: Icons.lock, hideText: true);
  }

  Widget _buildNextButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.lime),
          padding:
              MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 17.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
          ))),
      onPressed: () {
        // TODO: SEND DATA TO SERVER
        Navigator.pushNamed(context, '/home');
      },
      child: const Center(
        child: Text('LOGIN',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                letterSpacing: 1.5)),
      ),
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
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
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
                      SizedBox(height: 30),
                      _buildPassword(),
                      const SizedBox(height: 60),
                      _buildNextButton(context),
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
