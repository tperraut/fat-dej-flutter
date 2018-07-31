import 'dart:async';
import 'dart:convert';

import 'package:fatdej/app_config.dart';
import 'package:fatdej/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  var user;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginImg = new AssetImage("assets/login_pic.png");
    var apiUrl = AppConfig.of(context).apiBaseUrl;

    return new Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/login_background.png"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: new Image(
                  image: loginImg,
                  fit: BoxFit.fitHeight,
                ),
                constraints: new BoxConstraints.expand(height: 100.0),
              ),
              new Form(
                  child: new Theme(
                    data: new ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.deepOrange,
                        inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 20.0
                            )
                        )
                    ),
                    child: new Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Column(
                        children: <Widget>[
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Password"
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            controller: _passwordController,
                          ),
                          new Padding(
                              padding: const EdgeInsets.only(top: 20.0)
                          ),
                          new MaterialButton(
                              color: Colors.deepOrange,
                              textColor: Colors.white,
                              child: Text("Login"),
                              onPressed: () {
                                user = getUser(
                                "${apiUrl}auth/signin",
                                _emailController.text,
                                _passwordController.text
                                );
                              }
                          ),
                        ],
                      ),
                    ),
                  )
              )
            ],
          )
        ],
      ),
    );
  }


  Future<User> getUser(String url, String user, String password) async {
    final Map<String, String> header = {"Content-Type": "application/json"};
    final response = await http.post(
        url,
        headers: header,
        body: '{"email": "${user}", "password": "${password}"}'
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Mauvaise réponse : ${response.statusCode}");
    }
  }
}