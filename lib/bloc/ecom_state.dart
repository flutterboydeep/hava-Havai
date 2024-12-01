// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'ecom_bloc.dart';

@immutable
class EcomState {
  final String error;
  final int totalItems;
  final double mrp;
  final double discountPrice;
  final List favItemList;
  final List<ProductModel>? productItemList;
  final List<ProductModel>? cartList;

  EcomState({
    this.error = "",
    this.discountPrice = 0.0,
    this.mrp = 0.0,
    this.favItemList = const [],
    this.totalItems = 0,
    this.productItemList,
    this.cartList,
  });

  EcomState copyWith({
    String? error,
    int? totalItems,
    double? mrp,
    double? discountPrice,
    List? favItemList,
    List<ProductModel>? productItemList,
    List<ProductModel>? cartList,
  }) {
    return EcomState(
      error: error ?? this.error,
      totalItems: totalItems ?? this.totalItems,
      mrp: mrp ?? this.mrp,
      discountPrice: discountPrice ?? this.discountPrice,
      favItemList: favItemList ?? this.favItemList,
      productItemList: productItemList ?? this.productItemList,
      cartList: cartList ?? this.cartList,
    );
  }
}
