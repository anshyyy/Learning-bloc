import 'package:bloc/bloc.dart';
import 'package:learning_bloc/features/home/models/homeProductDataModel.dart';
import 'package:meta/meta.dart';

part 'checkout_bloc_event.dart';
part 'checkout_bloc_state.dart';

class CheckoutBlocBloc extends Bloc<CheckoutBlocEvent, CheckoutBlocState> {
  CheckoutBlocBloc() : super(CheckoutBlocInitial()) {
    on<CheckoutBlocEvent>((event, emit) {});
  }
}
