import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tanamind/cubit/favourite/add_delete_item_favourite_state.dart';
import 'package:tanamind/repository/favourite_repository/favourite_repository.dart';

class FavoriteActionCubit extends Cubit<FavoriteActionState> {
  FavoriteActionCubit({@required this.repository}) : super(InitialState());

  FavoriteAdd repository;

  void addItem(String id) async {
    try {
      var response = await FavoriteAdd().addItem('$id');
      var json = jsonDecode(response);
      var message = json['data']['response']['message'];
      emit(AddItemFav(message: message));
    } catch (e) {
      print("Error state : $e");
      emit(ActionIsError(message: 'Internal Server Error'));
    }
  }

  void deleteItem(String id) async {
    try {
      var response = await FavoriteDelete().deleteItem('$id');
      var json = jsonDecode(response);
      var message = json['data']['response']['message'];
      print(message);
      emit(DeleteItemFav(message: message));
    } catch (e) {
      emit(ActionIsError(message: 'Internal Server Error'));
    }
  }
}
