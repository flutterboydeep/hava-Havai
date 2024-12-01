import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notebook/bloc/apiData/api_repo.dart';
import 'package:notebook/data/favitemList.dart';
import 'package:notebook/models/product_model.dart';

part 'ecom_event.dart';
part 'ecom_state.dart';

class EcomBloc extends Bloc<EcomEvent, EcomState> {
  final ApiRepo apiRepo;
  EcomBloc(this.apiRepo) : super(EcomState()) {
    on<FavItemEvent>(favItemfun);
    on<FetchItemEvent>(fetchItemEvent);
    on<CardItemListEvent>(cardItemListEvent);
    // on<EcomEvent>((event, emit) {});
  }
  favItemfun(FavItemEvent event, Emitter<EcomState> emit) {
    emit(state.copyWith(
      favItemList: event.favItemList,
      discountPrice: event.discountPrice,
      mrp: event.mrp,
      totalItems: event.totalItems,
    ));
  }

  fetchItemEvent(FetchItemEvent event, Emitter<EcomState> emit) async {
    try {
      List<ProductModel> list = await apiRepo.getApiData();
      // log(list[0].products![0].id.toString());
      emit(state.copyWith(productItemList: await apiRepo.getApiData()));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  cardItemListEvent(CardItemListEvent event, Emitter<EcomState> emit) async {
    try {
      // log(list[0].products![0].id.toString());
      emit(state.copyWith(cartList: event.cartList));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
