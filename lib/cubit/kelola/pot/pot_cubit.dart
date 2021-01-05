import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/kelola/pot/pot_state.dart';
import 'package:tanamind/repository/kelola/pot_repository.dart';

class PotCubit extends Cubit<PotState> {
  PotCubit({this.repository}) : super(PotIsLoading());

  PotRepository repository;

  void getData() async {
    emit(PotIsLoading());
    try {
      var response = await PotRepository().getData();
      emit(PotIsLoaded(list: response));
    } catch (e) {
      print('error state : $e');
      emit(PotIsError());
    }
  }

  void deleteItem(var id) async {
    emit(PotIsLoading());
    try {
      var response = await PotRepository().deletePot('$id');
      var json = jsonDecode(response);
      var message = json['message'];
      emit(PotIsDeleted(message: message));
    } catch (e) {
      print('error state : $e');
      emit(PotIsError());
    }
  }
}
