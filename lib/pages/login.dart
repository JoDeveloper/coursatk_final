import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../notifirers/user_notifier.dart';
import '../repository/user_repository.dart';
import '../utils/route.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _phone = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final Color backgroundColor = Colors.grey;

  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          CircleAvatar(
            child: SvgPicture.asset(
              'images/logo.svg',
              width: 280.0,
              height: 280.0,
            ),
            maxRadius: 50,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 20.0,
          ),
          _buildLoginForm(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Routes.sailor.navigate("/signup");
                },
                child: Text("تسجيل",
                    style: TextStyle(color: Colors.blue, fontSize: 18.0)),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    final UserRepository userRepository = Provider.of<UserRepository>(context);
    return Consumer<UserNotifier>(
      builder: (context, user, child) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: <Widget>[
              ClipPath(
                clipper: RoundedDiagonalPathClipper(),
                child: Container(
                  height: 400,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      color: user.loginStatus == Status.running
                          ? Colors.blue.shade100
                          : Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 90.0,
                      ),
                      Container(
                          child: user.loginStatus == Status.running
                              ? CircularProgressIndicator(
                                  strokeWidth: 6.0,
                                  backgroundColor: Colors.deepOrangeAccent,
                                )
                              : null),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            controller: _phone,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.blue),
                            decoration: InputDecoration(
                                hintText: "رقم الهاتف",
                                hintStyle:
                                    TextStyle(color: Colors.blue.shade200),
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.blue,
                                )),
                          )),
                      Container(
                        child: Divider(
                          color: Colors.blue.shade400,
                        ),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            controller: _password,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.blue),
                            decoration: InputDecoration(
                                hintText: "كلمه السر",
                                hintStyle:
                                    TextStyle(color: Colors.blue.shade200),
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.blue,
                                )),
                          )),
                      Container(
                        child: Divider(
                          color: Colors.blue.shade400,
                        ),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: user.loginStatus == Status.running
                        ? backgroundColor
                        : Colors.blue.shade600,
                    child: Icon(Icons.person),
                  ),
                ],
              ),
              Container(
                height: 420,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: () {
                      bool loggedIn = user.login(_phone.text, _password.text);
                      if (loggedIn) {
                        Flushbar(
                          title: "Welcome",
                          message: "$userRepository.getUserName()",
                          duration: Duration(seconds: 3),
                        )..show(context);
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Text("تسجيل الدخول",
                        style: TextStyle(color: Colors.white70)),
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }
}
