import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learning_bloc/data/cartData.dart';
import 'package:meta/meta.dart';

import '../../home/models/homeProductDataModel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitalEvent>(cartInitalEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
    on<CheckOutButtonNavigateEvent>(navigateToCheckoutEvent);
  }

  FutureOr<void> cartInitalEvent(
      CartInitalEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    final item = event.productDataModel;
    cartItems.remove(item);
    emit(CartSuccessState(cartItems: cartItems));
  }

  Future<void> navigateToCheckoutEvent(
      CheckOutButtonNavigateEvent event, Emitter<CartState> emit) async {
    emit(CartNavigateToCheckoutActionState());
  }
}
