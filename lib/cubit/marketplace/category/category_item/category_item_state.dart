import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CategoryItemState extends Equatable {}

class ItemsIsLoading extends CategoryItemState {
  @override
  List<Object> get props => [];
}

class ItemGetData extends CategoryItemState{
  @override
  List<Object> get props => [];

}

class ItemSearch extends CategoryItemState{
  @override
  List<Object> get props => [];

}

class ItemsIsLoaded extends CategoryItemState {
  final list;

  ItemsIsLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}

class ItemsIsLoadMore extends CategoryItemState{
  final list;

  ItemsIsLoadMore({@required this.list});

  @override
  List<Object> get props => [list];

}

class ItemFilter extends CategoryItemState{
  @override
  List<Object> get props => [];

}

class ItemsIsError extends CategoryItemState {
  final message;

  ItemsIsError({@required this.message});

  @override
  List<Object> get props => [message];
}
