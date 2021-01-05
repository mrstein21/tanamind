import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/marketplace/category/category_item/category_item_state.dart';
import 'package:tanamind/model/marketplace_model/category_item_model.dart';
import 'package:tanamind/model/marketplace_model/category_model.dart';
import 'package:tanamind/repository/marketplace/list_category_item_repository.dart';
import 'package:meta/meta.dart';

class CategoryItemCubit extends Cubit<CategoryItemState> {
  CategoryItemCubit({@required this.repository}) : super(ItemsIsLoading());

  CategoryItemRepository repository;

  getData({var id,int page}) async {
    try {
      emit(ItemsIsLoading());
        var response = await CategoryItemRepository().getData(id, 1);
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

  void onLoadMore(var model, int page, String id) async {
    try {
      var prevList = model;
      var data = await CategoryItemRepository().getData(id, page);
      prevList = [...prevList, ...data];
      emit(ItemsIsLoaded(list: prevList));
    } catch (e) {
      print("Error state  : $e");
      emit(ItemsIsError(message: 'Internal Server Error...'));
    }
  }

  void onFilterItem({var filter, var sort, var id, int page}) async {
    try {
      var response =
          await CategoryItemRepository().getFilter('$id', '$page', filter, sort);
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

  void onSearchItem({var filter, var sort, var id, var key, int page}) async {
    try {
      var response =
      await CategoryItemRepository().getSearch('$id', '$page', filter, sort, key);
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
