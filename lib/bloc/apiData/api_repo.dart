import 'dart:convert';
import 'dart:developer';

import 'package:notebook/bloc/apiData/api_provider.dart';

import '../../models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiRepo {
  final ApiProvider apiProvider;
  ApiRepo(this.apiProvider);
  // Future<List<ProductModel>> getApiData() async {
  //   log("I am Running function sssssss");
  //   String apiData = await apiProvider.getApiProviderData();
  //   log("I am Running function MMMMMM");

  //   final data = jsonDecode(apiData);
  //   List<ProductModel> productList = (data['products'] as List)
  //       .map((item) => ProductModel.fromJson(item))
  //       .toList();
  //   print(productList[0].title);
  //   log("I am Running function EEEE");
  //   // print("------------------- $data");
  //   // List<ProductModel> notesModelList = productList
  //   //     .map(
  //   //       (e) => ProductModel.fromJson(e),
  //   //     )
  //   //     .toList();
  //   // log("I am Running function ------------------------");
  //   // log(notesModelList.toString());

  //   return productList;
  // }
  Future<List<ProductModel>> getApiData() async {
    log("I am Running function sssssss");
    String apiData = await apiProvider.getApiProviderData();
    log("I am Running function MMMMMM");

    // Decode the JSON response

    Map<String, dynamic> data = jsonDecode(apiData);

    // Access the products list
    List productList = await data['products'] as List;
    // log(productList.toString());

    // Map each product to ProductModel

    List<ProductModel> notesModelList = productList
        .map(
          (e) => ProductModel.fromJson(e),
        )
        .toList();

    // log(notesModelList.toString());
    return notesModelList;
  }
}
