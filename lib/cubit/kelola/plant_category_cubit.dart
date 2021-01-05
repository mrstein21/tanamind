import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/kelola/plant_category_state.dart';
import 'package:tanamind/model/kelola_model/plant_category_model.dart';
import 'package:tanamind/repository/kelola/plant_category_repository.dart';
import 'package:meta/meta.dart';

class PlantCategoryCubit extends Cubit<PlantCategoryState> {
  PlantCategoryCubit({@required this.category}) : super(InitialState());

  PlantCategoryRepository category;

  void getCategory() async {
    try {
      List<PlantCategoryModel> data = await PlantCategoryRepository().getData();
      emit(CategoryIsLoaded(list: data));
    } catch (e) {
      emit(CategoryIsError(e.toString()));
    }
  }
}
