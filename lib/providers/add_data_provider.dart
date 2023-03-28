import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/url.dart';

class AddDataProvider extends ChangeNotifier {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late String userId;

  AddDataProvider() {
    getPref();
  }

  Future<void> getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("id_user")!;
  }

  check() {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Data tidak boleh kosong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      _submitForm();
    }
  }

  Future<void> _submitForm() async {
    final url = Uri.parse(BaseUrl.create);
    final request = http.MultipartRequest('POST', url);

    request.fields.addAll({
      'title': titleController.text,
      'description': descriptionController.text,
      'user_id': userId,
    });

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final responseJson = json.decode(responseString);
      print(responseJson);

      Fluttertoast.showToast(
          msg: "Data berhasil ditambahkan",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      print('Error: ${response.reasonPhrase}');
      Fluttertoast.showToast(msg: "Data gagal ditambahkan");
    }
  }
}
