import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/data/favitemList.dart';
import 'package:notebook/screens/cart_item_page.dart';

import '../bloc/ecom_bloc.dart';
import '../models/product_model.dart';

bottomCardView(
  context,
) {
  return BlocBuilder<EcomBloc, EcomState>(
    builder: (context, state) {
      double sum = totalPriceFun(context, cartList);
      return state.favItemList.isNotEmpty
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Center(
                  child: BlocBuilder<EcomBloc, EcomState>(
                    builder: (context, state) {
                      return ListTile(
                        leading: Icon(
                          Icons.shopping_cart_outlined,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        title: Text(
                          "Amount Price",
                          style: TextStyle(
                              fontSize: 11,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.normal),
                        ),
                        subtitle: Text(
                          "₹ ${sum.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink.shade300,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11))),
                          onPressed: () {},
                          child: Text(
                            "View cart ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          : SizedBox();
    },
  );
}

totalPriceFun(context, List<ProductModel> list) {
  List<double> total = list.fold([0.0], (sum, item) {
    double mrp = item.price!.toDouble();
    double discountPercent = item.discountPercentage!.toDouble();

    double actualMrp = mrp - (mrp * (discountPercent / 100));
    sum[0] += actualMrp;
    log("the sum value is ${sum[0]}");

    return sum;
  });
  return total[0];
  // var total = list[index].price.fold(initialValue, (previousValue, element) => null);
}
