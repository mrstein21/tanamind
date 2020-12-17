import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/marketplace/category/category_item/category_item_state.dart';
import 'package:tanamind/model/marketplace_model/category_item_model.dart';
import 'package:tanamind/repository/marketplace/marketplace_category_item.dart';
import 'package:meta/meta.dart';

class CategoryItemCubit extends Cubit<CategoryItemState> {
  CategoryItemCubit({@required this.repository}) : super(ItemsIsLoading());

  CategoryItemRepository repository;

  getData(String id) async {
    try {
      emit(ItemsIsLoading());
      var response = await CategoryItemRepository().getData(id);
      if (response == 'data is empty') {
        emit(ItemsIsLoaded(list: 'null'));
      } else {
        emit(ItemsIsLoaded(list: response));
      }
    } catch (e) {
      print("Error state  : $e");
      emit(ItemsIsError(message: 'Internal Server Error...'));
    }
  }
}
