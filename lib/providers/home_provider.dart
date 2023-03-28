import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/url.dart';
import '../models/data.dart';

class HomeProvider extends ChangeNotifier {
  final list = <DataModel>[];
  bool loading = false;
  String username = ''; // memberikan nilai default

  HomeProvider() {
    showData();
    getPref();
  }

  Future<void> showData() async {
    list.clear();
    loading = true;
    notifyListeners();

    final url = Uri.parse(BaseUrl.read);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      data.forEach((api) {
        final ab = DataModel(
          api['id_data'],
          api['title'],
          api['description'],
          api['user_id'],
          api['nama'],
        );
        list.add(ab);
      });
    }

    loading = false;
    notifyListeners();
  }

  int get dataLength => list.length;

  Future<void> showMyDialog(idData, context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text("Are you sure want to delete this data?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                deleteData(idData);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteData(String idData) async {
    final url = Uri.parse(BaseUrl.delete);
    final response = await http.post(url, body: {
      "id_data": idData,
    });
    if (response.statusCode == 200) {
      list.removeWhere((data) => data.idData == idData);
      notifyListeners();
    } else {
      throw Exception('Failed to delete data');
    }
  }

  Future<void> getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString("nama") ?? ''; // memberikan nilai default
    notifyListeners();
  }
}
