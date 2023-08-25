import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/data/cart_Items.dart';
import 'package:meta/meta.dart';

import '../../Home/home_product_data_model.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitialState()) {
    on<CartBlocInitialEvent>(cartBlocInitialEvent);
  }

  FutureOr<void> cartBlocInitialEvent(CartBlocInitialEvent event, Emitter<CartBlocState> emit) {
    emit(CartBlocSuccessState(cartProducts: cartItems));
  }
}
