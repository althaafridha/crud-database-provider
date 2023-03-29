import 'dart:convert';

import 'package:crud_database_provider/models/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant/url.dart';

class EditDataProvider extends ChangeNotifier {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  Future<void> submitForm(String idData, TextEditingController title,
      TextEditingController description, BuildContext context) async {
    final url = Uri.parse(BaseUrl.update);
    final request = http.MultipartRequest('POST', url);

    request.fields.addAll({
      'title': title.text,
      'description': description.text,
      'id_data': idData,
    });

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final responseJson = json.decode(responseString);
      print(responseJson);
      notifyListeners();
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }

  void setData(DataModel data) {
    title.text = data.title!;
    description.text = data.description!;
  }
}
