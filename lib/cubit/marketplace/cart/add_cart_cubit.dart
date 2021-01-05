import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/marketplace/cart/add_cart_state.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/repository/marketplace/cart_repository.dart';

class AddCartCubit extends Cubit<AddCartState> {
  AddCartCubit({this.repository}) : super(InitialState());

  CartRepository repository;

  void addItem(var id) async {
    try {
      var response = await CartRepository().addData('$id');
      var json = jsonDecode(response);
      var message = json['message'];
      var cart = json['user']['cart_length'];
      UserPreferences.setUserCart(cart);
      emit(AddedItemCart(message: message));
    } catch (e) {
      print('error state : $e');
      emit(AddIsError(message: 'Internal Server Error'));
    }
  }
}
