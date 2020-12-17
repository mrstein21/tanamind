import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/favourite/favourite_state.dart';
import 'package:tanamind/repository/favourite_repository/favourite_repository.dart';
import 'package:meta/meta.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit({@required this.repository}) : super(FavouriteIsLoading());

  FavouriteRepository repository;

  void getData() async {
    try {
      emit(FavouriteIsLoading());
      var json = await FavouriteRepository().getData();
      emit(FavouriteIsLoaded(list: json));
    } catch (e) {
      print("error states : $e}");
      emit(FavouriteIsError(message: 'Internal Server Error...'));
    }
  }

  void delete(String id) async {
    try{
      var response = await FavouriteRepository().deleteItem('$id');
      var message = response['data']['response']['message'];
      print(message);
      emit(FavDeleted(message));
    }catch (e) {
      print("error state : $e}");
      emit(FavouriteIsError(message: 'Internal Server Error...'));
    }
  }
}
