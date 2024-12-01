import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/screens/cart_item_page.dart';

import 'package:notebook/utils/bottom_card.dart';

import '../bloc/ecom_bloc.dart';
import 'tabs/category_tab.dart';

import 'tabs/home_tab.dart';
import 'tabs/order_tab.dart';
import 'tabs/profile_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeTab(),
    CategoriesTab(),
    OrdersTab(),
    ProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
          'Catalogue',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 70, 70, 70),
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8),
            child: SizedBox(
              width: 35,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => CartItemPage()));
                },
                child: BlocBuilder<EcomBloc, EcomState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        Icon(Icons.shopping_cart_outlined),
                        state.favItemList.length == 0
                            ? SizedBox.shrink()
                            : Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 246, 41, 109),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      state.favItemList.length > 9
                                          ? "9+"
                                          : "${state.favItemList.length}",
                                      style: TextStyle(
                                          fontSize: 7, color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),

      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(117, 247, 167, 230),
              Color.fromARGB(179, 83, 28, 128),
            ])),
        child: Stack(
          children: [
            _pages[_selectedIndex],
          ],
        ),
      ),

      // bottomSheet: BottomSheet(

      //   onClosing: () {},
      //   builder: (context) {
      //     return Container(
      //       height: 200,
      //       color: Colors.green,
      //     );
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_carousel_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xff1A95BE),
        onTap: _onItemTapped,
      ),
    );
  }
}
