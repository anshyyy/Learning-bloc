import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/features/wishlist/ui/wishlistTile.dart';

import '../../cart/ui/cartTileWidget.dart';
import '../bloc/wishlist_bloc.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishlistBloc.add(WishlistInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Wishlist"),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
            bloc: wishlistBloc,
            listenWhen: (previous, current) => current is WishlistActionState,
            buildWhen: (current, previous) => current is! WishlistActionState,
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.runtimeType) {
                case WishlistSuccessState:
                  final wishlistSuccessState = state as WishlistSuccessState;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: wishlistSuccessState.wishlistItems.length,
                      itemBuilder: (context, index) {
                        return WishlistTileWidget(
                          productDataModel:
                              wishlistSuccessState.wishlistItems[index],
                          wishlistBloc: wishlistBloc,
                        );
                      });

                default:
                  return SizedBox();
              }
            }));
  }
}
