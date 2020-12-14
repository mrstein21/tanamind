import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tanamind/cubit/marketplace/category/category_cubit.dart';
import 'package:tanamind/cubit/marketplace/category/category_state.dart';
import 'package:tanamind/model/marketplace_model/category_model.dart';
import 'package:tanamind/ui/marketplace/marketplace/category/category_view_model.dart';

class ListCategory extends StatefulWidget {
  @override
  CategoryViewScreen createState() => CategoryViewScreen();
}

class CategoryViewScreen extends CategoryViewModel {
  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<CategoryCubit, MarketplaceCategoryState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is CategoryIsLoading) {
          return Container();
        } else if (state is CategoryIsLoaded) {
          return Container(
            height: 90,
            child: ListView.builder(
                itemCount: state.list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => navigationCategory(state.list[index].name),
                    child: _buildRowCategory(state.list[index], index),
                  );
                }),
          );
        } else if (state is CategoryIsError) {}
      },
    );
  }

  Widget _buildLoading() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 80,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              height: 80,
              width: 80,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        ));
  }

  Widget _buildRowCategory(MarketplaceCategoryModel category, int index) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black45.withOpacity(0.1),
                    spreadRadius: 2.0,
                    blurRadius: 2.0,
                    offset: Offset(0, 2),
                  ),
                ]),
            child: Center(
              child: Icon(
                categoryIcon[index]['icon'],
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              category.name,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
