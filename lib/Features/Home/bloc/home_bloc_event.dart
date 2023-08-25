part of 'home_bloc_bloc.dart';

abstract class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeProductWishListButtonClickedEvent extends HomeBlocEvent {
  final HomeProductDataModel clickedProducts;

  HomeProductWishListButtonClickedEvent({required this.clickedProducts});
}

class HomeProductCartButtonClickedEvent extends HomeBlocEvent {
  final HomeProductDataModel clickedProducts;

  HomeProductCartButtonClickedEvent({required this.clickedProducts});
}

class HomeProductWishListNavigateEvent extends HomeBlocEvent {}

class HomeProductCartNavigateEvent extends HomeBlocEvent {}
