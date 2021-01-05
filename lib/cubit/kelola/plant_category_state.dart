import 'package:equatable/equatable.dart';
import 'package:tanamind/model/kelola_model/plant_category_model.dart';
import 'package:meta/meta.dart';

abstract class PlantCategoryState extends Equatable {}


class InitialState extends PlantCategoryState{
  @override
  List<Object> get props => [];

}

class CategoryIsLoaded extends PlantCategoryState {
  final List<PlantCategoryModel> list;

  CategoryIsLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}

class CategoryIsError extends PlantCategoryState {
  final message;

  CategoryIsError(this.message);

  @override
  List<Object> get props => [message];
}
