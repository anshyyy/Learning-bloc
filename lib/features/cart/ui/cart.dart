import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/features/cart/bloc/cart_bloc.dart';

import '../../home/ui/productTileWidget.dart';
import 'cartTileWidget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartBloc.add(CartInitalEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Items"),
          backgroundColor: Colors.teal,
        ),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartSuccessState:
                final cartSuccessState = state as CartSuccessState;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartSuccessState.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTileWidget(
                        productDataModel: cartSuccessState.cartItems[index],
                        cartBloc: cartBloc,
                      );
                    });
              default:
                return SizedBox();
            }
          },
        ));
  }
}
