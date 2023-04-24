part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitalEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedproduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedproduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedproduct;

  HomeProductCartButtonClickedEvent({required this.clickedproduct});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
