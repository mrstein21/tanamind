import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/auth/login/login_cubit.dart';
import 'package:tanamind/cubit/auth/register/register_cubit.dart';
import 'package:tanamind/cubit/kelola/plant_category_cubit.dart';
import 'package:tanamind/cubit/marketplace/category/category_cubit.dart';
import 'package:tanamind/cubit/marketplace/promo/promo_cubit.dart';
import 'package:tanamind/repository/auth/login.dart';
import 'package:tanamind/repository/auth/register.dart';
import 'package:tanamind/repository/kelola/plant_repository.dart';
import 'package:tanamind/repository/marketplace/marketplace_category.dart';
import 'package:tanamind/repository/marketplace/marketplace_promo.dart';

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
        create: (context) => PlantCategoryCubit(category: PlantRepository()),
      ),
      BlocProvider<PromotionCubit>(
        create: (context) =>
            PromotionCubit(repository: MarketplacePromoRepository()),
      ),
      BlocProvider<CategoryCubit>(
        create: (context) => CategoryCubit(repository: CategoryRepository()),
      ),
    ], child: widget.child);
  }
}
