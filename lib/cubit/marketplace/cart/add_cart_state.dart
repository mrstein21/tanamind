abstract class AddCartState {

}

class InitialState extends AddCartState{
  @override
  List<Object> get props => [];
}

class AddedItemCart extends AddCartState{
  final message;

  AddedItemCart({this.message});

  @override
  List<Object> get props => [message];
}

class AddIsError extends AddCartState{
  final message;

  AddIsError({this.message});

  @override
  List<Object> get props => [message];
}