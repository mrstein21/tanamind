import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/marketplace/category/category_state.dart';
import 'package:tanamind/model/marketplace_model/category_model.dart';
import 'package:tanamind/repository/marketplace/marketplace_category.dart';
import 'package:meta/meta.dart';

class CategoryCubit extends Cubit<MarketplaceCategoryState> {
  CategoryCubit({@required this.repository}) : super(CategoryIsLoading()) {
    getData();
  }

  CategoryRepository repository;

  void getData() async {
    try {
      emit(CategoryIsLoading());
      List<MarketplaceCategoryModel> list =
          await CategoryRepository().getData();
      emit(CategoryIsLoaded(list: list));
    } catch (e) {
      print('State error : $e');
      emit(CategoryIsError(message: 'Connection problem...'));
    }
  }
}
