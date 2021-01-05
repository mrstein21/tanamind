import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/kelola/plant/plant_state.dart';
import 'package:tanamind/repository/kelola/plant_repository.dart';

class PlantCubit extends Cubit<PlantState> {
  PlantCubit({this.repository}) : super(PlantIsLoading());

  PlantRepository repository;

  void getData() async {
    try {
      emit(PlantIsLoading());

      var response = await PlantRepository().getData();
      emit(PlantIsLoaded(list: response));
    } catch (e) {
      print('error state : $e');
      emit(PlantIsError(message: 'Internal Server Error...'));
    }
  }

  void getCategory(var key) async {
    try {
      emit(PlantIsLoading());

      var response = await PlantRepository().getCategory('$key');
      emit(PlantIsLoaded(list: response));
    } catch (e) {
      print('error state : $e');
      emit(PlantIsError(message: 'Internal Server Error...'));
    }
  }

  void getSearch(var key) async {
    try {
      emit(PlantIsLoading());

      var response = await PlantRepository().getSearch('$key');
      emit(PlantIsLoaded(list: response));
    } catch (e) {
      print('error state : $e');
      emit(PlantIsError(message: 'Internal Server Error...'));
    }
  }
}
