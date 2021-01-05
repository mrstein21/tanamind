import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/marketplace/similar_item/similar_item_state.dart';
import 'package:tanamind/repository/marketplace/similar_item_repository.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit({this.repository}) : super(SimilarIsLoading());

  SimilarRepository repository;

  void getData(var id) async {
    try {
      emit(SimilarIsLoading());
      var response = await SimilarRepository().getData('$id');
      emit(SimilarIsLoaded(list: response));
    } catch (e) {
      print('error state : $e');
      emit(SimilarIsError(message: 'Internal Server Error.'));
    }
  }
}
