import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tanamind/model/marketplace_model/category_model.dart';

abstract class MarketplaceCategoryState extends Equatable {}

class CategoryIsLoading extends MarketplaceCategoryState {
  @override
  List<Object> get props => [];
}

class CategoryIsLoaded extends MarketplaceCategoryState {
  final List<MarketplaceCategoryModel> list;

  CategoryIsLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}

class CategoryIsError extends MarketplaceCategoryState {
  final message;

  CategoryIsError({@required this.message});

  @override
  List<Object> get props => [message];
}
