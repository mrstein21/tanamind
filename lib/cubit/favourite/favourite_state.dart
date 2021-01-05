import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class FavoriteState extends Equatable {}

class FavoriteIsLoading extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteIsLoaded extends FavoriteState {
  final list;

  FavoriteIsLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}

class IsEmpty extends FavoriteState{
  @override
  List<Object> get props => [];

}

class FavDeleted extends FavoriteState {
  final message;

  FavDeleted(this.message);

  @override
  List<Object> get props => [message];
}

class FavoriteIsError extends FavoriteState {
  final message;

  FavoriteIsError({@required this.message});

  @override
  List<Object> get props => [message];
}
