import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:momo_recorder_ui_app/firebase_options.dart';
import 'package:momo_recorder_ui_app/src/services/authentication_service.dart';
import 'package:momo_recorder_ui_app/src/views/transact.dart';
import 'package:momo_recorder_ui_app/src/views/home.dart';
import 'package:momo_recorder_ui_app/src/views/list.dart';
import 'package:momo_recorder_ui_app/src/views/login.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const Remo());
}

class Remo extends StatelessWidget {
  const Remo({Key? key}) : super(key: key);

  /*
  This widget is the root of the [Way] application
  */
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'Remo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            primaryColor: Colors.lightBlueAccent,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const AuthenticationWrapper(),
        initialRoute: '/',
        routes: {
          '/home': (context) => const RemoHome(),
          '/login': (context) => Login(),
          '/commissions': (context) => const RemoCommission(),
          '/view-transactions': (context) => const RemoViewTransactions(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const RemoHome();
    }

    return Login();
  }
}
