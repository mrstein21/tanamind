import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/auth/login/login_cubit.dart';
import 'package:tanamind/cubit/auth/register/register_cubit.dart';
import 'package:tanamind/cubit/favourite/add_fav_cubit.dart';
import 'package:tanamind/cubit/favourite/favourite_cubit.dart';
import 'package:tanamind/cubit/kelola/plant/plant_cubit.dart';
import 'package:tanamind/cubit/kelola/plant_category_cubit.dart';
import 'package:tanamind/cubit/kelola/pot/pot_cubit.dart';
import 'package:tanamind/cubit/marketplace/cart/add_cart_cubit.dart';
import 'package:tanamind/cubit/marketplace/cart/cart_cubit.dart';
import 'package:tanamind/cubit/marketplace/category/category_cubit.dart';
import 'package:tanamind/cubit/marketplace/category/category_item/category_item_cubit.dart';
import 'package:tanamind/cubit/marketplace/promo/promo_cubit.dart';
import 'package:tanamind/cubit/marketplace/similar_item/similar_item_cubit.dart';
import 'package:tanamind/repository/auth/login.dart';
import 'package:tanamind/repository/auth/register.dart';
import 'package:tanamind/repository/favorite/favourite_repository.dart';
import 'package:tanamind/repository/kelola/plant_category_repository.dart';
import 'package:tanamind/repository/kelola/plant_repository.dart';
import 'package:tanamind/repository/kelola/pot_repository.dart';
import 'package:tanamind/repository/marketplace/cart_repository.dart';
import 'package:tanamind/repository/marketplace/marketplace_category_repository.dart';
import 'package:tanamind/repository/marketplace/list_category_item_repository.dart';
import 'package:tanamind/repository/marketplace/marketplace_promo.dart';
import 'package:tanamind/repository/marketplace/similar_item_repository.dart';

class ListBlocProvider extends StatefulWidget {
  final child;

  const ListBlocProvider({Key key, this.child}) : super(key: key);

  @override
  _ListBlocProviderState createState() => _ListBlocProviderState();
}

class _ListBlocProviderState extends State<ListBlocProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(LoginRepository()),
      ),
      BlocProvider<RegisterCubit>(
        create: (context) => RegisterCubit(RegisterRepository()),
      ),
      BlocProvider<PlantCategoryCubit>(
        create: (context) =>
            PlantCategoryCubit(category: PlantCategoryRepository()),
      ),
      BlocProvider<PlantCubit>(
        create: (context) => PlantCubit(repository: PlantRepository()),
      ),
      BlocProvider<PotCubit>(
          create: (context) => PotCubit(repository: PotRepository())),
      BlocProvider<PromotionCubit>(
        create: (context) =>
            PromotionCubit(repository: MarketplacePromoRepository()),
      ),
      BlocProvider<CategoryCubit>(
        create: (context) => CategoryCubit(repository: CategoryRepository()),
      ),
      BlocProvider<CategoryItemCubit>(
        create: (context) =>
            CategoryItemCubit(repository: CategoryItemRepository()),
      ),
      BlocProvider<FavouriteCubit>(
        create: (context) => FavouriteCubit(repository: FavouriteRepository()),
      ),
      BlocProvider(
        create: (context) => AddFavCubit(repository: FavoriteAdd()),
      ),
      BlocProvider<AddCartCubit>(
        create: (context) => AddCartCubit(repository: CartRepository()),
      ),
      BlocProvider(
        create: (context) => CartCubit(CartRepository()),
      ),
      BlocProvider(
        create: (context) => SimilarCubit(repository: SimilarRepository()),
      ),
    ], child: widget.child);
  }
}
