import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/url.dart';

enum LoginStatus { notSignin, signIn }

class AuthProvider extends ChangeNotifier {
  LoginStatus loginStatus = LoginStatus.notSignin;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  createUser(context) async {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Data tidak boleh kosong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    var url = Uri.parse(BaseUrl.register);
    final response = await http.post(url, body: {
      "nama": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    });
    final data = jsonDecode(response.body);
    int value = data["value"] ?? 0;
    if (value == 1) {
      Navigator.pushNamed(context, '/home');
      Fluttertoast.showToast(
        msg: "Register Berhasil",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: "Register Gagal",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  login() async {
    var url = Uri.parse(BaseUrl.login);
    final response = await http.post(url, body: {
      "email": emailController.text,
      "password": passwordController.text,
    });
    final data = jsonDecode(response.body);

    int value = data['value'];
    String idUser = data['id_user'];
    String usernameAPI = data['nama'];
    String emailAPI = data['email'];
    if (value == 1) {
      loginStatus = LoginStatus.signIn;
      savePref(value, idUser, usernameAPI, emailAPI);
      Fluttertoast.showToast(
          msg: "Login berhasil",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      notifyListeners();
    } else {
      Fluttertoast.showToast(
          msg: "login gagal",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  savePref(int value, String idUser, String username, String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("value", value);
    preferences.setString("id_user", idUser);
    preferences.setString("nama", username);
    preferences.setString("email", email);
    preferences.commit();
  }
}
