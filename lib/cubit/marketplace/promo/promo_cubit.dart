import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tanamind/cubit/marketplace/promo/promo_state.dart';
import 'package:tanamind/model/marketplace_model/promo_model.dart';
import 'package:tanamind/repository/marketplace/marketplace_promo.dart';

class PromotionCubit extends Cubit<MarketplacePromotionState> {
  PromotionCubit({@required this.repository}) : super(PromotionIsLoading()){
    getData();
  }

  MarketplacePromoRepository repository;

  void getData() async {
    try {
      emit(PromotionIsLoading());
      await Future.delayed(new Duration(seconds: 3));
      List<MarketplacePromotionModel> list =
          await MarketplacePromoRepository().getPromotion();
      emit(PromotionIsLoaded(list: list));
    } catch (e) {
      print('state error : $e}');
      emit(PromotionIsError(message: 'Connection Problem...'));
    }
  }
}
