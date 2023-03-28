import 'package:crud_database_provider/screens/home_page_view.dart';
import 'package:crud_database_provider/screens/login_page_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

enum LoginStatus { notSignin, signIn }

class _WrapperState extends State<Wrapper> {
  late LoginStatus loginStatus = LoginStatus.notSignin;

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (loginStatus) {
      case LoginStatus.notSignin:
        return const LoginPageView();
      case LoginStatus.signIn:
        return const HomePageView();
    }
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignin;
    });
  }
}
