

import 'dart:async';

import 'package:flutter_application_1/Features/Home/home_product_data_model.dart';
import 'package:flutter_application_1/data/WishList_Items.dart';
import 'package:flutter_application_1/data/cart_Items.dart';
import 'package:flutter_application_1/data/groceryData.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc() : super(HomeBlocInitial()) {
    on<HomeProductWishListNavigateEvent>(homeProductWishListNavigateEvent);

    on<HomeProductCartNavigateEvent>(homeProductCartNavigateEvent);

    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeProductWishListButtonClickedEvent>(homeProductWishListButtonClickedEvent);
  }

  ////////functions

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeBlocState> emit) {

      emit(HomeBlocLoadingState());
      Future.delayed(const Duration(seconds: 3));
      emit(HomeBlocSuccessState(
        products: GroceryData.groceryProducts.map((e) => HomeProductDataModel(
          id: e['id'], 
          name: e['name'], 
          category : e['category'], 
          imgUrl: e['image'], 
          price: e['price']))
          .toList(),
          )
          );
  }
  
  FutureOr<void> homeProductWishListNavigateEvent(HomeProductWishListNavigateEvent event, Emitter<HomeBlocState> emit) {
    emit(HomeBlocNavigateWishListActionState());
  }

  FutureOr<void> homeProductCartNavigateEvent(HomeProductCartNavigateEvent event, Emitter<HomeBlocState> emit) {
    emit(HomeBlocNavigateCartActionState());
  }
  
  
  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeBlocState> emit) {
    cartItems.add(event.clickedProducts);
    emit(HomeProductButtonCartedActionState());
  }
  
  FutureOr<void> homeProductWishListButtonClickedEvent(HomeProductWishListButtonClickedEvent event, Emitter<HomeBlocState> emit) {
    wishListItems.add(event.clickedProducts);
    emit(HomeProductButtonWishListedActionState());
  }

  }
