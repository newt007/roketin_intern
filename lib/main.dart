import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:roketin_intern/modules/auth/auth_screen.dart';
import 'package:roketin_intern/modules/confirmation/confirm_screen.dart';
import 'package:roketin_intern/utils/utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainPage(),
      routes: {
        ConfirmationScreen.routeName: (context) => ConfirmationScreen()
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return ConfirmationScreen();
          } else if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if(snapshot.hasError) {
            return Center(child: Text("Something wrong"));
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}
