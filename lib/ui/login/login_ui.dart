import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app_flutter/ui/home/HomePage.dart';
import 'package:learning_app_flutter/ui/login/login_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    // Consumer<LoginProvider>(context, provider, child)=>HomePage();
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: Consumer<LoginProvider>(
          // ignore: missing_return
          builder: (context, provider ,child){
            switch (provider.isLogin){
              case true: return HomePage();

              case false: return Scaffold(
                appBar: AppBar(
                  title: Text("Login"),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: new Container(
                        decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: new Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.mail_outline),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: new Container(
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          border: new Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: TextField(
                          // controller: provider.passTextFieldController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.vpn_key),
                          ),
                        ),
                      ),
                    ),
                    Consumer<LoginProvider>(
                      builder: (context, provider, child) => Container(
                        padding: EdgeInsets.only(left: 50, right: 50),
                        margin: EdgeInsets.only(top: 16),
                        height: 40,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {
                            provider.loginByFirebase();
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    Consumer<LoginProvider>(
                      builder: (context, provider, child) => Container(
                        padding: EdgeInsets.only(left: 50, right: 50),
                        margin: EdgeInsets.only(top: 16),
                        height: 40,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {
                            provider.registrationByFirebase();
                          },
                          child: Text(
                            "Registration",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }

          }

      ),
    );
  }
}
