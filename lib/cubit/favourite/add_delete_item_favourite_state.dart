import 'package:meta/meta.dart';

abstract class FavoriteActionState {}

class InitialState extends FavoriteActionState {
  @override
  List<Object> get props => [];
}

class AddItemFav extends FavoriteActionState {
  final message;

  AddItemFav({@required this.message});

  @override
  List<Object> get props => [message];
}

class DeleteItemFav extends FavoriteActionState {
  final message;

  DeleteItemFav({@required this.message});

  @override
  List<Object> get props => [message];
}

class ActionIsError extends FavoriteActionState {
  final message;

  ActionIsError({@required this.message});

  @override
  List<Object> get props => [message];
}
