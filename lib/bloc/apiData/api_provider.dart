import 'dart:convert';
import 'dart:developer';

import '../../models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future getApiProviderData() async {
    List<ProductModel> notesModelList;
    try {
      var response =
          await http.get(Uri.parse("https://dummyjson.com/products"));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw "Error is ${response.statusCode}";
      }

      // return notesModelList;
    } catch (e) {
      throw e.toString();
    }
  }
}
