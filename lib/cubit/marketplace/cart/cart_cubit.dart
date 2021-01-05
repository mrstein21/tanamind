import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:tanamind/cubit/marketplace/cart/cart_state.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/model/hive_model/hive_cart_model.dart';
import 'package:tanamind/repository/marketplace/cart_repository.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cubit) : super(CartIsLoading());

  CartRepository cubit;

  void getData() async {
    try {
      emit(CartIsLoading());
      var response = await CartRepository().getData();
      emit(CartIsLoaded(data: response));
    } catch (e) {
      print('Error State : $e');
      emit(CartIsError(message: 'Internal Server Error...'));
    }
  }

  void getHive() async {
    try {
      var response = await CartRepository().getData();
      await Hive.openBox('cartmodel');
      var cart = Hive.box('cartmodel');
      var json = jsonDecode(response);
      var data = json['data'];

      if(cart.length != data.length){
        for (int i = 0; i < data.length; i++) {
          cart.clear();
          cart.add(HiveCartModel(
            itemId: data[i]['id'],
            id: data[i]['item']['id'],
            name: data[i]['item']['name'],
            price: data[i]['item']['price'],
            description: data[i]['item']['sort_desc'],
            qty: 1,
          ));
        }
      }

      print('${cart.length} : ${data.length}');
      emit(CartIsLoaded(data: data));
    } catch (e) {
      print('Error State : $e');
      emit(CartIsError(message: 'Internal Server Error...'));
    }
  }

  void addItemCart(var id) async {
    try {
      var response = await CartRepository().addData(id);
      var json = jsonDecode(response);
      var message = json['message'];
      emit(CartIsAdded(
        message: message,
      ));
    } catch (e) {
      print('Error State : $e');
      emit(CartIsError(message: 'Internal Server Error...'));
    }
  }

  void deleteItemCart(var id) async {
    try {
      var response = await CartRepository().deleteData(id);
      var json = jsonDecode(response);
      var data = json['user']['cart_length'];
      var message = json['message'];
      cartLength = data;
      emit(CartIsDeleted(
        message: message,
      ));
    } catch (e) {
      print('Error State : $e');
      emit(CartIsError(message: 'Internal Server Error...'));
    }
  }
}
