import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/Features/Home/home_product_data_model.dart';
import 'package:flutter_application_1/data/WishList_Items.dart';

part 'wish_list_bloc_event.dart';
part 'wish_list_bloc_state.dart';

class WishListBlocBloc extends Bloc<WishListBlocEvent, WishListBlocState> {
  WishListBlocBloc() : super(WishListBlocInitial()) {
    on<WishListBlocInitialEvent>(wishListBlocInitialEvent);
    on<WishListRemoveItemEvent>(wishListRemoveItemEvent);
  }

  FutureOr<void> wishListBlocInitialEvent(WishListBlocInitialEvent event, Emitter<WishListBlocState> emit) {
    emit(WishListBlocSuccessState(wishListProducts: wishListItems));
    }

  FutureOr<void> wishListRemoveItemEvent(WishListRemoveItemEvent event, Emitter<WishListBlocState> emit) {
    wishListItems.remove(event.products);
    emit(WishListBlocSuccessState(wishListProducts: wishListItems));
  }
}
