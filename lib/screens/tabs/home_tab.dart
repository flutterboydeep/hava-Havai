import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/bloc/ecom_bloc.dart';
import 'package:notebook/data/bener_list.dart';

import '../../data/favitemList.dart';
import '../cart_item_page.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    fetchData(context);
  }

  CarouselSliderController carouselController = CarouselSliderController();
  PersistentBottomSheetController? _bottomSheetController;
  int bannerCurrentIndex = 0;
  fetchData(context) {
    return BlocProvider.of<EcomBloc>(context).add(FetchItemEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.my_location,
                  color: Color.fromARGB(255, 15, 15, 15),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Choose your location',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 209, 32, 141),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 194, 24, 126),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 209, 32, 141),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 209, 32, 100),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 150,
              width: double.infinity,
              // color: Colors.blueAccent,
              child: CarouselSlider(
                carouselController: carouselController,
                items: bannerList.map((image) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.blue.shade100, BlendMode.colorBurn)),
                          ),
                        );
                      },
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Center(child: Icon(Icons.error)),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    // setState(() {
                    bannerCurrentIndex = index;
                    // });
                  },
                ),
              ),
              // child: Center(
              //   child: Text(
              //     'Product Banner',
              //     style: TextStyle(color: Colors.white, fontSize: 24),
              //   ),
              // ),
            ),
            // SizedBox(
            //   height: 15,
            //   width: double.infinity,
            //   child: Center(
            //     child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         shrinkWrap: true,
            //         itemCount: bannerList.length,
            //         itemBuilder: (context, index) {
            //           // if(index==bannerCurrentIndex){

            //           // }
            //           // var selectedIndex=carouselController.
            //           return Padding(
            //             padding: const EdgeInsets.all(3.0),
            //             child: AnimatedContainer(
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(15),
            //                   color: bannerCurrentIndex == index
            //                       ? Color.fromARGB(255, 209, 32, 141)
            //                       : Color.fromARGB(255, 181, 181, 181)),
            //               duration: Duration(milliseconds: 500),
            //               height: 15,
            //               width: bannerCurrentIndex == index ? 30 : 10,
            //             ),
            //           );
            //         }),
            //   ),
            // ),
            SizedBox(height: 16),
            Text(
              '   Products',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            BlocBuilder<EcomBloc, EcomState>(
              // buildWhen: (previous, current) =>
              // previous.productItemList != current.productItemList ||

              builder: (context, state) {
                if (state.error.isNotEmpty) {
                  return Center(child: Text(state.error));
                } else if (state.productItemList == null) {
                  return Center(child: CircularProgressIndicator());
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 260,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  itemCount: state.productItemList!.length,
                  itemBuilder: (context, index) {
                    var product = state.productItemList![index];
                    double mrp = product.price!.toDouble();
                    double discountPecent =
                        product.discountPercentage!.toDouble();
                    double actualMrp = mrp - (mrp * (discountPecent / 100));

                    // log(state.productItemList![index].products![index].id
                    //     .toString());
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 200,
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: product.thumbnail.toString(),
                                  imageBuilder: (context, imageProvider) {
                                    return Image(image: imageProvider);
                                  },
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Center(child: Icon(Icons.error)),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SizedBox(
                                      height: 25,
                                      width: 50,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              padding: EdgeInsets.all(0),
                                              backgroundColor: Color.fromARGB(
                                                  255, 252, 229, 236)),
                                          onPressed: () {
                                            if (state.favItemList
                                                .contains(product)) {
                                              favItemList.remove(state
                                                  .productItemList![index]);
                                              BlocProvider.of<EcomBloc>(context)
                                                  .add(FavItemEvent(
                                                      totalItems: 0,
                                                      mrp: mrp,
                                                      discountPrice: actualMrp,
                                                      favItemList:
                                                          favItemList));

                                              log("All ready add in this item");
                                            } else {
                                              favItemList.add(state
                                                  .productItemList![index]);
                                              BlocProvider.of<EcomBloc>(context)
                                                  .add(FavItemEvent(
                                                      totalItems: 1,
                                                      mrp: mrp,
                                                      discountPrice: actualMrp,
                                                      favItemList:
                                                          favItemList));
                                              log("Added  this item");
                                            }
                                          }, // state.favItemList.where((element) =>
                                          //       element.id == product.id);
                                          child: Text(
                                            state.favItemList.contains(product)
                                                ? "Added"
                                                : "Add",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.pink.shade500),
                                          )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  product.brand.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "₹$mrp",
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.normal,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "₹${actualMrp.toStringAsFixed(2)}",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${discountPecent.toStringAsFixed(2)}% OFF",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 209, 32, 141),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
