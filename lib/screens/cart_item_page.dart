import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/data/favitemList.dart';
import 'package:notebook/models/product_model.dart';
import 'package:notebook/utils/bottom_card.dart';

import '../bloc/ecom_bloc.dart';

List<ProductModel> cartList = [];

class CartItemPage extends StatefulWidget {
  const CartItemPage({super.key});

  @override
  State<CartItemPage> createState() => _CartItemPageState();
}

class _CartItemPageState extends State<CartItemPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(117, 247, 167, 230),
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 70, 70, 70),
        ),
        title: Text(
          'Cart',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 70, 70, 70),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(117, 247, 167, 230),
        child: BlocBuilder<EcomBloc, EcomState>(
          builder: (context, state) {
            return state.favItemList.isNotEmpty
                ? Stack(
                    children: [
                      ListView.builder(
                          itemCount: state.favItemList.length,
                          itemBuilder: (context, index) {
                            var product = state.favItemList[index];
                            double mrp = product.price!.toDouble();
                            double discountPecent =
                                product.discountPercentage!.toDouble();
                            double actualMrp =
                                mrp - (mrp * (discountPecent / 100));
                            if (!cartList.contains(favItemList[index])) {
                              cartList.add(state.favItemList[index]);
                              BlocProvider.of<EcomBloc>(context)
                                  .add(CardItemListEvent(cartList: cartList));
                            }
                            int itemcount = cartList
                                .where(
                                  (element) =>
                                      element == state.favItemList[index],
                                )
                                .length;

                            // total_price = total_price + total_price;
                            // BlocProvider.of<EcomBloc>(context).add(FavItemEvent(
                            //     totalItems: state.favItemList.length,
                            //     mrp: mrp,
                            //     discountPrice: totalPrice,
                            //     favItemList: favItemList));

                            log("I am running again -----------");
                            return SizedBox(
                              height: 150,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                product.thumbnail.toString(),
                                            imageBuilder:
                                                (context, imageProvider) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                              Colors.blue
                                                                  .shade100,
                                                              BlendMode
                                                                  .colorBurn)),
                                                ),
                                              );
                                            },
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) => Center(
                                                    child: Icon(Icons.error)),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.title.toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                product.brand.toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "₹$mrp",
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        color: Colors.grey),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    "₹${actualMrp.toStringAsFixed(2)}",
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "${discountPecent.toStringAsFixed(2)}% OFF",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 209, 32, 141),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(child: SizedBox()),
                                                  SizedBox(
                                                    height: 30,
                                                    width: 80,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      child: ColoredBox(
                                                          color: Color.fromARGB(
                                                              255,
                                                              215,
                                                              214,
                                                              214),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  if (!state
                                                                      .cartList!
                                                                      .contains(
                                                                          state.favItemList[
                                                                              index])) {
                                                                    favItemList.remove(
                                                                        state.favItemList[
                                                                            index]);
                                                                    cartList.remove(
                                                                        state.favItemList[
                                                                            index]);

                                                                    totalPriceFun(
                                                                        context,
                                                                        cartList);
                                                                    BlocProvider.of<EcomBloc>(context).add(FavItemEvent(
                                                                        totalItems:
                                                                            favItemList
                                                                                .length,
                                                                        mrp:
                                                                            mrp,
                                                                        discountPrice:
                                                                            actualMrp,
                                                                        favItemList:
                                                                            favItemList));

                                                                    BlocProvider.of<EcomBloc>(
                                                                            context)
                                                                        .add(CardItemListEvent(
                                                                            cartList:
                                                                                cartList));
                                                                  } else {
                                                                    cartList.remove(
                                                                        state.favItemList[
                                                                            index]);
                                                                    BlocProvider.of<EcomBloc>(
                                                                            context)
                                                                        .add(CardItemListEvent(
                                                                            cartList:
                                                                                cartList));
                                                                  }
                                                                },
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      0,
                                                                      0,
                                                                      0),
                                                                ),
                                                              ),
                                                              Text(
                                                                itemcount
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .pink
                                                                        .shade400),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  cartList.add(
                                                                      state.favItemList[
                                                                          index]);
                                                                  BlocProvider.of<
                                                                              EcomBloc>(
                                                                          context)
                                                                      .add(CardItemListEvent(
                                                                          cartList:
                                                                              cartList));
                                                                },
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      0,
                                                                      0,
                                                                      0),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                    ),
                                                    // child: ElevatedButton(
                                                    //     style: ElevatedButton.styleFrom(
                                                    //         minimumSize: Size(0, 35),
                                                    //         maximumSize: Size(0, 35),
                                                    //         padding:
                                                    //             EdgeInsets.symmetric(
                                                    //                 horizontal: 0),
                                                    //         backgroundColor:
                                                    //             Color(0xff1A95BE),
                                                    //         shape:
                                                    //             RoundedRectangleBorder(
                                                    //                 borderRadius:
                                                    //                     BorderRadius
                                                    //                         .circular(
                                                    //                             11))),
                                                    //     onPressed: () {},
                                                    //     child: Align(
                                                    //       alignment:
                                                    //           Alignment.topCenter,
                                                    //       child: Row(
                                                    //         mainAxisSize:
                                                    //             MainAxisSize.min,
                                                    //         crossAxisAlignment:
                                                    //             CrossAxisAlignment
                                                    //                 .center,
                                                    //         mainAxisAlignment:
                                                    //             MainAxisAlignment
                                                    //                 .spaceBetween,
                                                    //         children: [
                                                    //           TextButton(
                                                    //             child: Text("-"),
                                                    //             onPressed: () {},
                                                    //           ),
                                                    //           Text(
                                                    //             "f",
                                                    //             // produtCountInList
                                                    //             //     .toString(),
                                                    //             style: TextStyle(
                                                    //                 color:
                                                    //                     Colors.white,
                                                    //                 fontSize: 15),
                                                    //           ),
                                                    //           // TextButton(
                                                    //           //   onPressed: () {
                                                    //           //     // log("--------------------------------");
                                                    //           //   },
                                                    //           //   child: Icon(
                                                    //           //     Icons.add,
                                                    //           //     color: Colors.white,
                                                    //           //   ),
                                                    //           //   // child: Text(
                                                    //           //   //   "+",
                                                    //           //   //   style: TextStyle(
                                                    //           //   //       fontSize: 18,
                                                    //           //   //       color: Colors.white),
                                                    //           //   // ),
                                                    //           // ),                                                                                *
                                                    //           TextButton(
                                                    //             child: Text("+"),
                                                    //             onPressed: () {},
                                                    //           ),
                                                    //         ],
                                                    //       ),
                                                    //     )),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      bottomCardView(
                        context,
                      ),
                    ],
                  )
                : Center(
                    child: Text("Card is Empty till now "),
                  );
          },
        ),
      ),
    );
  }
}
