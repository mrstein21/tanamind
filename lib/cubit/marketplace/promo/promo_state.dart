import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tanamind/model/marketplace_model/promo_model.dart';

abstract class MarketplacePromotionState extends Equatable {}

class PromotionIsLoading extends MarketplacePromotionState {
  @override
  List<Object> get props => [];
}

class PromotionIsLoaded extends MarketplacePromotionState {
  final List<MarketplacePromotionModel> list;

  PromotionIsLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}

class PromotionIsError extends MarketplacePromotionState {
  final message;

  PromotionIsError({@required this.message});

  @override
  List<Object> get props => [message];
}
