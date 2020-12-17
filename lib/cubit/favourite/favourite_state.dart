import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class FavouriteState extends Equatable {}

class FavouriteIsLoading extends FavouriteState {
  @override
  List<Object> get props => [];
}

class FavouriteIsLoaded extends FavouriteState {
  final list;

  FavouriteIsLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}

class FavDeleted extends FavouriteState {
  final message;

  FavDeleted(this.message);

  @override
  List<Object> get props => [message];
}

class FavouriteIsError extends FavouriteState {
  final message;

  FavouriteIsError({@required this.message});

  @override
  List<Object> get props => [message];
}
