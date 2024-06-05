part of 'checkout_bloc_bloc.dart';

@immutable
sealed class CheckoutBlocState {}

final class CheckoutBlocInitial extends CheckoutBlocState {}

final class CheckoutSuccessSate extends CheckoutBlocBloc {
  final List<ProductDataModel> checkoutItems;

  CheckoutSuccessSate({required this.checkoutItems});
}
