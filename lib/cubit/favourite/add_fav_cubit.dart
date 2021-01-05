import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tanamind/cubit/favourite/add_fav_state.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/repository/favorite/favourite_repository.dart';

class AddFavCubit extends Cubit<AddFavState> {
  AddFavCubit({@required this.repository}) : super(InitialState());

  FavoriteAdd repository;

  void addItem(String id) async {
    try {
      var response = await FavoriteAdd().addItem('$id');
      var json = jsonDecode(response);
      var message = json['message'];
      var fav = json['user']['fav_length'];
      UserPreferences.setUserFav(fav);
      emit(AddItemFav(message: message));
    } catch (e) {
      print("Error state : $e");
      emit(ActionIsError(message: 'Internal Server Error'));
    }
  }
}
