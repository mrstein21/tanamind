import 'package:meta/meta.dart';

abstract class AddFavState {}

class InitialState extends AddFavState {
  @override
  List<Object> get props => [];
}

class AddItemFav extends AddFavState {
  final message;

  AddItemFav({@required this.message});

  @override
  List<Object> get props => [message];
}

class ActionIsError extends AddFavState {
  final message;

  ActionIsError({@required this.message});

  @override
  List<Object> get props => [message];
}
