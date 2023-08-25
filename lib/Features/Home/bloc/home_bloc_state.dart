part of 'home_bloc_bloc.dart';


abstract class HomeBlocState {}

abstract class HomeBlocActionState extends HomeBlocState {}

class HomeBlocInitial extends HomeBlocState {}

class HomeBlocLoadingState extends HomeBlocState {}

class HomeBlocSuccessState extends HomeBlocState {
  final List<HomeProductDataModel> products;

  HomeBlocSuccessState({required this.products});
}

class HomeBlocErrorState extends HomeBlocState {}

class HomeBlocNavigateWishListActionState extends HomeBlocActionState {}

class HomeBlocNavigateCartActionState extends HomeBlocActionState {}

class HomeProductButtonWishListedActionState extends HomeBlocActionState {}

class HomeProductButtonCartedActionState extends HomeBlocActionState {}


