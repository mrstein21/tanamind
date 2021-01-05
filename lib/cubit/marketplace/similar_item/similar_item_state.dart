import 'package:equatable/equatable.dart';

abstract class SimilarState extends Equatable {}

class SimilarIsLoading extends SimilarState {
  @override
  List<Object> get props => [];
}

class SimilarIsLoaded extends SimilarState {
  final list;

  SimilarIsLoaded({this.list});

  @override
  List<Object> get props => [list];
}

class SimilarIsError extends SimilarState {
  final message;

  SimilarIsError({this.message});

  @override
  List<Object> get props => [message];
}
