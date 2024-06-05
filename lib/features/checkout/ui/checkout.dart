import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/features/checkout/bloc/checkout_bloc_bloc.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutBlocBloc, CheckoutBlocState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CheckoutSuccessSate:
              return Scaffold(
                appBar: AppBar(
                  title: Text("Checkout"),
                  backgroundColor: Colors.teal,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart_checkout_outlined,
                          color: Colors.black,
                        ))
                  ],
                ),
                body: Column(
                  children: [],
                ),
              );

            default:
              return SizedBox();
          }
        });
  }
}
