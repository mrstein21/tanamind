import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tanamind/cubit/favourite/favourite_state.dart';
import 'package:tanamind/repository/favorite/favourite_repository.dart';

class FavouriteCubit extends Cubit<FavoriteState> {
  FavouriteCubit({@required this.repository}) : super(FavoriteIsLoading());

  FavouriteRepository repository;

  void getData() async {
    try {
      emit(FavoriteIsLoading());
      var json = await FavouriteRepository().getData();
      if (json.isNotEmpty) {
        emit(FavoriteIsLoaded(list: json));
      } else {
        emit(IsEmpty());
      }
    } catch (e) {
      print("error states : $e}");
      emit(FavoriteIsError(message: 'Internal Server Error...'));
    }
  }

  void delete(String id) async {
    try {
      var response = await FavouriteRepository().deleteItem('$id');
      var message = response['message'];
      emit(FavDeleted(message));
    } catch (e) {
      print("error state : $e}");
      emit(FavoriteIsError(message: 'Internal Server Error...'));
    }
  }
}
