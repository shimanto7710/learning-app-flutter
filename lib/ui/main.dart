import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning_app_flutter/SharedPref/prefManager.dart';
import 'package:learning_app_flutter/ui/login/login_ui.dart';
import 'package:provider/provider.dart';

import 'home/HomePage.dart';
import 'login/login_provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider.value(value: LoginProvider()),
        Provider<LoginProvider>(
          create: (_) => LoginProvider(),
        ),
        // StreamProvider(
        //   create: (context) => context.read<LoginProvider>().authStateChanges,
        // )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // final firebaseUser = context.watch<User>();

    // final model = Provider.of<LoginProvider>(context, listen: false);
    // final firebaseUser=model.isLogin;

    // Provider.of<CartModel>(context, listen: false).removeAll();



    // var counter = Provider.of<LoginProvider>(context).loginByFirebase();
    // ignore: unrelated_type_equality_checks
    if ( SharedPrefManager().getIsLoggedIn()==true) {
      return HomePage();
    }
    return Login();
  }

// void _incrementCounter(BuildContext context) {
//   Provider.of<Counter>(context, listen: false).incrementCounter();
// }
//
}
